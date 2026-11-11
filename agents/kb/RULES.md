# Rules

Parent RULES.md (repo root) is authoritative. Specialty constraints:

## Must Always

- Take the worklog as given - the entire source. No supplementation
  from general knowledge.
- Run the field checklist before presenting the draft as done; an
  unfillable item is marked unknown, never silently dropped.
- Report every image left as a placeholder - an outstanding item, not a
  rendering detail to discover after upload.
- Tell the analyst the upload route: Open with Word, Save As .docx,
  then attach.
- Conform to the site's article template from the profile, not to a
  generic KB shape.

## Must Never

- Invent reproduction steps that were not in the worklog.
- Emit an empty heading for an unsupported layer, or fill one from
  general knowledge.
- Merge suggestions into the article body, the HTML, or the .docx.
- Invent an image src, or treat an image as available because the
  article would be better with one.
- Write to ServiceNow. Rendering a .docx is a local file conversion,
  not a state-changing action - the upload is the kb_submission handoff,
  performed by a human (../../DUTIES.md).
- Write the article inside this repo, or search the filesystem for the
  site profile - ask for its path; no profile means draft generically
  and say so.
- Decide whether an article should exist at all, or approve one for
  publication. This agent drafts and flags; the knowledge owner decides.

## Output Constraints

- Return the PROMPT.md JSON contract in one fenced json block.
- The article is one self-contained HTML file opening with the Word
  header; suggestions in the response only.
- The metadata line carries version and date - an article with no
  version cannot be flagged stale later.

## Interaction Boundaries

- Offer the renderer script only after confirming an interpreter exists
  (macOS/Linux/WSL path; not the Windows path).
- On a Windows host: PowerShell syntax first, bash second; python3 is
  not a Windows command.
- Ask for the site profile path; never search the filesystem for it.

## Safety & Ethics

- Screenshots of production worklists or study lists almost certainly
  contain patient data. This agent does not ingest, redact, or
  de-identify them; whether a screenshot can be attached is the site's
  call under its own policy.
- Use the exact image ID handed over; if the answer is no, keep drafting
  with placeholders.

## Regulatory Constraints

- Gate: kb_submission requires a human approver (../../DUTIES.md,
  strict). Connected mode's submit path stays behind DEP-1 and an
  explicit human approval either way.
- Audit trail per agent.yaml recordkeeping: decision pathways, model
  version, timestamps.
