# Flows & Business Rules

## Guest flow
1. Choose one service.
2. Choose an artisan or “Surprise me”; automatic assignment picks the available artisan with the shortest active queue.
3. Enter a first name (1–30 characters) and join.
4. Receive a sequential daily-style token and token URL.
5. Track queue position and estimated wait; optionally confirm leaving the queue.

## Staff flow
1. Barber opens `/barber/:id` and sets chair availability.
2. Call the first waiting guest only when there is no serving guest.
3. Finish the serving guest or mark a no-show. A no-show advances the next waiting guest automatically.
4. Manager may add a walk-in and change any artisan's availability.

## Rules and edge cases
- Active statuses are `waiting` and `serving`; completed/absent entries no longer take a place in line.
- A barber has at most one serving entry; call-next is disabled when none are waiting or the seat is occupied.
- Queue order follows join timestamp. Estimate sums the remaining waiting service durations ahead of the guest.
- The demo token increments from the largest existing token. Production must use a database transaction and salon-local date to avoid duplicate tokens across devices.
- Offline artisans are excluded from automatic assignment; if there are no available artisans, joining is rejected.
- Name is required, trimmed, and capped at 30 characters. Feedback is optional and capped at 280 characters.
- Queue data is device-local in demo mode. Refresh retains it; another browser/device will not see changes.
- Production writes must enforce role permissions server-side. Do not expose Supabase service-role credentials in the browser.
