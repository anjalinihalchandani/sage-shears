# SAGE & SHEARS — Screen Inventory

| Route | Audience | Main content and actions |
|---|---|---|
| `/join` | Public guests | Brand landing, six service cards, artisan selection/automatic shortest queue, first-name form, join action. Loading is local and immediate; no available artisan prevents joining. |
| `/token/:id` | Guest with token | Token, service, artisan, live-in-app position and wait estimate, status, leave confirmation. Missing token shows recovery link. |
| `/display` | Salon guests | Full-screen three-column board with serving guest and next three guests per artisan, availability, live indicator. |
| `/barber/:id` | Barber | Availability selector, current guest, finish/no-show controls, waiting list and call-next action. |
| `/admin` | Manager | Four summary metrics, add walk-in, per-artisan queues and availability controls, analytics link. |
| `/analytics` | Manager | Daily visit summary and hourly activity chart, per-artisan visit totals. Sample counts are clearly identified in the interface. |
| `/feedback/:token` | Guest after visit | Five-star rating and thank-you state. |
| `/*` | Public | Friendly not-found page with link back to joining. |

The experience is responsive down to a narrow mobile layout. The local demo store persists queue changes in browser localStorage.
