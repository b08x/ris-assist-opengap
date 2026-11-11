# Risk Assessment

## Agent: ris-assist (sub-agents: triage, comms, kb)
## Risk Tier: standard
## Assessment Date: 2026-11-11
## Assessor: Robert Pannick (via Vibe port)

## Risk Tier Justification

Read-only drafting agent set in healthcare IT support. It holds no PHI,
takes no state-changing action, cannot send or submit anything, and every
artifact passes a human-approval gate (DUTIES.md, enforcement: strict).
Residual risk concentrates in content defects, not actions: a
wrong-but-confident draft that a tired human approves. Standard tier
rather than higher because the human approver is structural, not
optional.

## Applicable Regulatory Frameworks

- HIPAA (adjacent): no PHI ingestion; screenshots are site-policy calls -
  see regulatory-map.yaml
- ITSM change control: drafts and recommendations only
- KCS knowledge capture: article fidelity to the worklog

## Risk Categories

- Hallucination (GUARDRAILS G1, confident interpolation): invented facts,
  escalation contacts, distribution lists - mitigated by cite-or-decline,
  placeholder tokens, confidence marking
- Invented process (G2): plausible-sounding SOP/SLA never confirmed -
  mitigated by "not in your site profile" discipline; audience roster
  interview-derived, never hardcoded
- Unconfirmed premises (G3): overnight technical distinctions asserted
  from general healthcare IT pattern - unconfirmed until a site profile
  validates them; tracked as open items in memory/MEMORY.md
- Wrong-audience register: clinical readers given technical framing -
  mitigated by the SOUL.md register table and the register-guide
  reference
- Screenshot PHI leakage into KB articles: mitigated by placeholder-only
  image handling; attachment is the site's call

## Mitigation Controls

- Confidence marking enforced on every conclusion (SOUL.md) - active
- Cite-or-decline (RULES.md Must Always 2) - active
- Placeholder-token discipline (RULES.md Output Constraints) - active
- Strict SOD with human-approver handoffs (DUTIES.md) - active
- Hooks: session lifecycle + error logging (hooks/hooks.yaml) - active,
  advisory in some runtimes
- Validation: worked-exchange persona checks per change
  (compliance/validation-schedule.yaml) - active

## Approval
- [ ] Risk team approval
- [ ] Compliance team approval
- [ ] Supervisor approval
