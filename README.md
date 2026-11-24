# SAGE & SHEARS — Queue Management System

A responsive salon queue demo with guest, barber, manager, display, and feedback views.
## Live Demo
[Open the deployed app](https://sage-shears.vercel.app)

## Run locally

1. Install Node.js 20 or later.
2. In this folder, run `npm install`.
3. Run `npm run dev` and open the local address Vite prints.

The default app is a local demo. It stores edits in this browser's localStorage and starts with a sample queue. No Supabase account is needed to explore it.

## Routes

- `/join` — guest flow
- `/token/:id` — guest token
- `/display` — public queue display
- `/barber/meera`, `/barber/kabir`, `/barber/aarav` — barber controls
- `/admin` — salon overview
- `/analytics` — demo analytics
- `/feedback/:token` — post-visit feedback

## Stack and data

React 18, TypeScript, Vite 5, React Router 6, Zustand 4, custom CSS, and Lucide React. See `docs/` for product scope and rules. `supabase/schema.sql` is a production starting point; connecting it requires Supabase project credentials, enabling Realtime, and adding production authentication/RLS policies. This build does not yet perform remote reads or writes.

## Environment

Copy `.env.example` to `.env.local` when preparing the Supabase integration. The current demo does not read these values. Never put a service-role key in a Vite client environment.

## Features

- [x] Join queue, choose a service and artisan, shortest-queue assignment
- [x] Guest token, queue position estimate, leave confirmation
- [x] Live display view (shared local demo state)
- [x] Barber dashboard with call/finish/no-show controls
- [x] Manager queue overview and walk-in entry
- [x] Analytics view
- [x] Feedback rating screen

## Known limitations

- Demo state is local to one browser, so separate devices do not synchronize.
- Barber/admin routes are not protected by authentication.
- Token sequencing and analytics use demo assumptions; production needs transactional database operations and real aggregated data.
- Browser notifications, sound alerts, Hindi translations, and database-backed feedback validation are not wired up.
