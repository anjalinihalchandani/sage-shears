-- SAGE & SHEARS database starter. Review policies and configure Auth before production.
create extension if not exists pgcrypto;

create table if not exists public.barbers (
  id text primary key check (id in ('meera','kabir','aarav')),
  name text not null,
  specialty text not null default '',
  status text not null default 'available' check (status in ('available','break','offline')),
  auth_user_id uuid unique,
  created_at timestamptz not null default now()
);

create table if not exists public.queue_entries (
  id uuid primary key default gen_random_uuid(),
  salon_day date not null default (now() at time zone 'Asia/Kolkata')::date,
  token_number integer not null,
  token text generated always as ('SS-' || lpad(token_number::text,2,'0')) stored,
  customer_name text not null check (char_length(trim(customer_name)) between 1 and 30),
  service_name text not null,
  estimated_minutes integer not null check (estimated_minutes > 0),
  barber_id text not null references public.barbers(id),
  status text not null default 'waiting' check (status in ('waiting','serving','completed','absent')),
  timestamp_joined timestamptz not null default now(),
  timestamp_called timestamptz,
  timestamp_completed timestamptz,
  rating smallint check (rating between 1 and 5),
  feedback text check (char_length(feedback) <= 280),
  unique (salon_day, token_number)
);

create index if not exists queue_entries_barber_active_idx on public.queue_entries(barber_id, status, timestamp_joined);
alter table public.queue_entries replica identity full;
alter table public.barbers replica identity full;

insert into public.barbers (id,name,specialty) values
 ('meera','Meera','Colour & considered cuts'),
 ('kabir','Kabir','Fades & classic trims'),
 ('aarav','Aarav','Beards & little ones')
on conflict (id) do nothing;

alter table public.barbers enable row level security;
alter table public.queue_entries enable row level security;

-- Public reads support the guest and salon display. Tighten customer data access
-- before production: customer_name should not be exposed to arbitrary visitors.
create policy "Public can read barbers" on public.barbers for select to anon, authenticated using (true);
create policy "Public can read queue for demo display" on public.queue_entries for select to anon, authenticated using (true);
create policy "Guests can join queue" on public.queue_entries for insert to anon, authenticated
  with check (status = 'waiting' and customer_name = trim(customer_name));
-- Staff updates require a matching barber auth identity. Configure admin role
-- claims and separate admin policies before production deployment.
create policy "Barbers update their queue" on public.queue_entries for update to authenticated
  using (barber_id in (select id from public.barbers where auth_user_id = auth.uid()))
  with check (barber_id in (select id from public.barbers where auth_user_id = auth.uid()));
create policy "Barbers update their availability" on public.barbers for update to authenticated
  using (auth_user_id = auth.uid()) with check (auth_user_id = auth.uid());

-- Production token allocation should be done transactionally (e.g. RPC + per-day
-- counter table/row lock), not by client-side max(token_number)+1.
