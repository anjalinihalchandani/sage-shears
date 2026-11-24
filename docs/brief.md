# SAGE & SHEARS — Project Brief

## One-line description
A calm, real-time walk-in queue experience for a botanical barbershop and salon.

## Problem and users
Paper tokens leave guests unsure of their wait and require staff to manage the queue manually. Customers join without an account, choose a service and artisan, and track a token. Barbers manage their own chair. The salon manager oversees all chairs and daily performance. A public display helps guests follow the live queue.

## Stack
- React 18, TypeScript, Vite 5
- Custom responsive CSS, Cormorant Garamond + DM Sans
- Zustand 4 for shared queue state; React Router DOM 6
- Supabase PostgreSQL, Auth, and Realtime integration points (cloud credentials required)
- Lucide React icons; Recharts dependency reserved for analytics extensions
- Vercel-ready SPA rewrite

## Brand
Forest `#11251B` / deep forest `#0F2419`, fern `#2F9E6E`, terracotta `#D9774F`, cream `#F7F3E8`, moss `#65A30D`, honey `#EAB308`, brick `#B91C1C`. Heading: Cormorant Garamond. Body: DM Sans. Tokens are `SS-01`, `SS-02`, and so on.

## MVP features
1. Guest self-service with six services, artisan choice, shortest-queue assignment, and token.
2. Guest token page with live position estimate and leave-queue confirmation.
3. Public three-chair queue display.
4. Barber controls to call next, complete or skip a guest, and set availability.
5. Salon overview, walk-in entry, and daily analytics view.
6. Post-visit star feedback.

## Out of scope
Online appointments, payments, SMS, customer accounts, multiple branches, and production authentication are not implemented. The delivered app uses local demo state; Supabase is a documented integration target.
