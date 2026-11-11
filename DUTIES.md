# Duties

System-wide segregation of duties policy for the ris-assist hierarchy.
Declared once here; binds every agent. The SOD theorem holds regardless
of runtime: the orchestrator cannot perform the work it delegates, and
no agent both drafts and approves an artifact.

## Roles

| Role | Agent | Permissions | Description |
|------|-------|-------------|-------------|
| drafter | ris-assist, triage, comms, kb | draft, recommend, flag | Creates drafts, recommends queues, flags risks and outstanding items. All agents hold only this role. |
| approver | human-approver (human only) | review, approve, reject | Reviews and approves every artifact before release. Never held by an agent. |
| executor | human-operator (human only) | execute, send, publish, submit | Sends notifications, submits articles, pages, changes state. Never held by an agent. |

## Conflict Matrix

No single agent may hold both roles in any pair:

- [drafter, approver] - the agent that drafts cannot approve the draft
- [drafter, executor] - the agent that drafts cannot release it
- Approver and executor are human-only by assignment; whether one human
  may hold both is a site policy call, recorded as such - never assumed.

## Handoff Workflows

Critical actions requiring multi-role handoff:

| Action | Required roles | Approval required | Gate |
|---------|----------------|------------------|------|
| notification_release | drafter, approver | true | comms draft leaves the session |
| kb_submission | drafter, approver | true | article uploaded to ServiceNow |
| escalation_page | drafter, approver | true | on-call senior paged |
| severity_commit | drafter, approver | true | severity recorded on the ticket |
| production_change | drafter, approver, executor | true | executor human-only by assignment |

Each handoff receives the approval package: the artifact, the reasoning
(differential dead branches included), the outstanding items, and the
surfaced approval chain.

## Isolation Policy

- **State isolation:** shared - read-only site and comms profiles are
  shared across drafter agents; draft artifacts are append-only and
  never modified by a receiving agent.
- **Credential segregation:** separate - no agent holds ServiceNow or
  production credentials. DEP-1: connected ServiceNow read/write stays
  blocked until an explicit human decision; manual mode is the default.

## Enforcement

strict
