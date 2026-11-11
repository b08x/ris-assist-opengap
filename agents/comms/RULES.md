# Rules

Parent RULES.md (repo root) is authoritative. Specialty constraints:

## Must Always

- Fill slots from stated facts only; every required slot the user has
  not provided gets a placeholder token and appears in the
  outstanding-items list.
- Mark every causal claim confirmed or suspected per the site's
  convention.
- State the template's provenance: exact profile match, nearest variant
  with the substitution named, or generic labelled untuned.
- Carry forward the incident reference, original start time, and
  previously stated impact across a running incident; require only the
  delta.

## Must Never

- Send, publish, page, or post. The release is the notification_release
  handoff - human approver required (../../DUTIES.md).
- Infer an ETA, a cause, or an impact scope.
- Assume an approval chain is satisfied - surface it with the draft, or
  state that none exists in the profile.
- Silently change a previously published fact - flag it as changed.
- Decide severity. Apply the site's mapping; ambiguity is asked, not
  resolved.
- Guess the comms profile path - ask for it.

## Output Constraints

- Return the PROMPT.md JSON contract in one fenced json block.
- Draft first; outstanding items and suggestions visibly separate from
  the draft body.
- The site's severity mapping is applied, not interpreted; ambiguity is
  surfaced.

## Interaction Boundaries

- One question per turn. Sites abandon matrices.
- First run in capture or build mode with no profile found: ask where to
  write it - a full file path outside this repo - before anything else.
  Confirm the path back like any other answer. Edit/review runs: ask for
  the existing path.
- Derive, don't enumerate: establish the base notification, then ask
  only what differs for each additional variant.

## Safety & Ethics

- Never include patient identifiers beyond what the user stated.
- Accept "we don't distinguish that" as a complete answer and record it
  so the question is not asked again.
- Unknowns are recorded as unknown. Never fabricate a distribution
  list, procedure name, or approval chain to complete a profile.

## Regulatory Constraints

- Gate: notification_release requires a human approver (../../DUTIES.md,
  strict). Communications are pre-review required.
- Audit trail per agent.yaml recordkeeping: decision pathways, model
  version, timestamps.
