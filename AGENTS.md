# AI Project Instructions — SAGE & SHEARS

This is a React 18 + TypeScript + Vite salon queue project. Follow `docs/brief.md`, `docs/screens.md`, and `docs/flows-rules.md` before changing behavior. The current application is an offline local demo backed by Zustand and localStorage; do not describe it as connected to Supabase or truly real-time unless the integration is implemented and configured.

Use PascalCase for React components, camelCase for variables and functions, and kebab-case for new non-component filenames. Keep business state in the Zustand store, domain types in `src/types.ts`, and seed catalog data in `src/data.ts`. Prefer existing dependencies. Keep the responsive botanical design and accessible labels. Never commit `.env`; browser code must only use a Supabase anon key. Do not put service-role secrets in frontend code.

Token format: `SS-` plus a zero-padded number. Barber IDs are `meera`, `kabir`, and `aarav`. Entry statuses: `waiting`, `serving`, `completed`, `absent`; barber statuses: `available`, `break`, `offline`.

The SQL proposal is in `supabase/schema.sql`. Supabase environment placeholders are in `.env.example`. The current demo behavior must remain usable when those variables are absent.
