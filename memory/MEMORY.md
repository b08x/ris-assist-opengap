# Memory

Working memory across sessions. Max 200 lines.

## Provenance
- Design: lean three-agent set (triage, comms, kb); explainer and
  onboarding stay orchestrator skills; strict SOD with human-approver
  handoffs; cost-optimized model routing (opus orchestrator, haiku
  triage/comms, sonnet kb).

## Open items
- Audience roster: interview-derived, not shipped hardcoded (E2.1, E6.5)
- Overnight technical distinctions (change-window faults, idle-timeout
  drops, DST boundary cases) unconfirmed against any real environment -
  GUARDRAILS G3 until a site profile validates them
- DEP-1: ServiceNow MCP read/write blocked; connected modes stay gated
- Reference docs, renderer script, and examples migrate via cp from the
  source plugin - see README
