---
name: mirror-erp
description: How to answer questions about a company's Mirror ERP data (sales/purchase orders, work orders, production status, BOM/MPP, stock, invoices, product sizes/CBM/photos) with the Mirror MCP tools. Use whenever the user asks about their Mirror data, a customer, supplier, product, SO/PO/WO number, or wants an Excel of Mirror data.
---

# Answering Mirror ERP questions

## Always
1. Call `find_mirror_data` with the user's question **unchanged**, then `run_mirror_data` with the best entry.
2. Filter by **ids, not names**: turn a customer, supplier, product or SO/PO/WO number into its id with the
   lookup entry named in the filter's `idFrom`, then filter by that id.
3. If a lookup answers `notFound`, say that name does not exist and show the names that do. Do not ask again.
4. Prefer a **recipe** entry when one answers the whole question (one call, not one call per order).
5. Answer only from tool results. Never guess numbers. Say when rows are partial or access is denied.
6. A login can have several companies: pass `company` when the user names one, and say which company an
   answer is from. Never confirm that a company outside the user's own list exists.

## Mirror words
| User says | Means in Mirror | Entry |
|---|---|---|
| BOM, bill of materials, MPP, production plan | Master Production Plan (materials, processes, outsourcing) | `production_plan` |
| production status of orders, tracker | SO lines → work orders → process progress | `order_production_tracker` |
| size, carton, CBM, photo | packing template + physical properties | `product_sizes` |
| sales / purchase invoice | invoice type `Sales_Invoice` / `Purchase_Invoice` | `invoice_report` |

If a plan has no materials, say the plan is empty. Never fall back to the Product BOM.

## Excel / all rows
When the user wants a file, Excel or all rows, pass `export: true` and give the download link
(valid 24 hours). Photo links in answers are valid for up to 7 days.

## Changes (only where the server offers write tools)
Always `prepare_mirror_change` first, show the preview to the user in plain words, and call
`apply_mirror_change` only after the user says yes. For a requisition, ask whether it is for a work order.
