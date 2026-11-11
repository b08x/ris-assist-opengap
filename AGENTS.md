# ris-assist

Radiology IT overnight support assistant as an OpenGAP multi-agent
orchestration. Drafts and recommends only; never executes. Every artifact
requires human approval before release (DUTIES.md, strict).

## Capabilities

- Differential-driven ticket triage until routable (agents/triage)
- Incident communication drafting matched to audience register
  (agents/comms)
- Knowledge base article capture from resolved worklogs (agents/kb)
- Domain explanation and new-analyst curriculum (skills/explainer)
- Site profile onboarding, single-field edits, review (skills/onboarding)
- Deterministic pipelines: workflows/triage-flow.yaml,
  comms-draft-flow.yaml, kb-draft-flow.yaml

## Constraints

- Read-only: no state-changing action against any production system
- Every artifact passes a human-approver handoff before release
- No HL7 segment/field parsing (separate forensics plugin, ADR-0008)
- No identified PHI; screenshots are the site's call under its own policy
- Site-specific facts come only from the site profile; never invented
- Profiles live outside this repo at user-confirmed paths; never searched
  for, never committed
