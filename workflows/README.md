# Workflows

Export your n8n workflows as JSON and save them here.
Re-import them via: n8n Settings → Import workflow.

## Structure

| Folder        | Purpose                                              |
|---------------|------------------------------------------------------|
| `core/`       | Webhook listener, session router, main menu          |
| `appointments/` | Booking, confirmation, reminder flows              |
| `quotes/`     | Price quote flows per device & repair type           |
| `status/`     | Repair status lookup & update notifications          |
| `ai/`         | OpenAI-powered fallback & free-text understanding    |

## Naming convention

  FLOW_NAME.workflow.json

Examples:
  core/webhook-receiver.workflow.json
  appointments/booking-flow.workflow.json
  status/status-lookup.workflow.json
