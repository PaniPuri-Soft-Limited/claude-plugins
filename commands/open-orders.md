---
description: Open sales orders of a customer with their production status
argument-hint: <customer name> [company]
---
Show the open sales orders of customer "$ARGUMENTS" with the production status of each line
(which process each work order is at, pending quantity). Use the Mirror `order_production_tracker`
recipe in one call. End with a short summary: orders, lines, work orders, and anything stuck.
Offer an Excel export.
