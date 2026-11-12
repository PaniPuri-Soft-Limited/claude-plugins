# Mirror ERP for Claude

Mirror ERP is the manufacturing and export ERP made by Panipurisoft. This plugin lets people who use Mirror
ask Claude about their own company's data in plain language, in English or Hindi, and get answers
and Excel files straight from their live Mirror account.

## What you can ask
- Open sales orders of a buyer with the production status of every line and work order
- BOM of a product (Mirror's master production plan): materials, processes, outsourcing
- Stock of a product in each department or store
- Purchase orders, requisitions, invoices, payments, rejection, machine and department reports
- Item size, carton size, CBM and product photos
- "Give me this in Excel" for any of the above

## What is inside
| Part | What it does |
|---|---|
| Mirror ERP connector | Connects Claude to `https://mcp.panipurisoft.in/MirrorMCPServer/mcp`. You sign in with your own Mirror login; Claude sees only what that login can see in Mirror. |
| Skill `mirror-erp` | Teaches Claude how Mirror works: look up ids before filtering, BOM means master production plan, use one-call recipes, offer Excel. |
| Commands | `/mirror-erp:open-orders <customer>`, `/mirror-erp:bom <product codes>`, `/mirror-erp:stock <product> [department]` |
| Agent `purchase-planner` | Reads work-order material needs, stock and open purchase orders and suggests what to buy, per supplier. It only reads data. |

## Getting started
1. Add the plugin, then connect **Mirror ERP** on the plugin's Connectors tab.
2. Sign in with your own Mirror login.
3. Ask, for example: "Loberon ke open orders ka production status batao" or `/mirror-erp:bom RET 4109`.

If your login has several Mirror companies, name the company in your question.

## Changes to Mirror data
Where your Mirror login allows changes, Claude first shows a preview of the change, and the Mirror server
applies it only after you confirm. Nothing is saved in Mirror without that confirmation.

## Data and privacy
- The plugin sends your questions and the filters Claude chooses to the Mirror ERP server at
  `mcp.panipurisoft.in`, run by Panipurisoft. The server reads your Mirror data with your own login and
  returns the rows to Claude. Nothing is sent anywhere else.
- The server keeps an audit log of each call (user, question, entry used, time) to support and improve the
  service. Excel files are deleted after 24 hours; photo links expire within 7 days.
- The plugin runs no scripts or programs on your computer.
- Privacy policy: https://mcp.panipurisoft.in/MirrorMCPServer/privacy.html · Help: https://mcp.panipurisoft.in/MirrorMCPServer/help.html

## Support
mirror_mcp@panipurisoft.in
