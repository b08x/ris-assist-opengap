---
name: knowledge
description: >-
  Turns a resolved ticket or worklog into a ServiceNow-importable
  knowledge base article - triage-first HTML draft, rendered to .docx for
  upload - detects recurring incidents with no matching article, and
  flags articles made stale by a change or upgrade. Use when an incident
  is resolved and worth documenting, when the same question keeps
  recurring, or when the user says "turn this into a KB article".
license: MIT
allowed-tools: "Read, Write, Glob"
metadata:
  author: "Robert Pannick"
  version: "0.2.0"
  category: knowledge-capture
---

# Knowledge capture

Implements backlog E7. Connected mode (E7.3/E7.4, ServiceNow read/write)
is blocked on DEP-1; manual mode is fully usable now and is the default.
Persona: ../../../../SOUL.md. Observation/inference separation and
cite-or-decline apply to article bodies same as everywhere else.

## Modes

- **manual** - triage-first HTML draft plus a rendered .docx, with an
  outstanding-items list and a separate suggestions block. Works with
  no ServiceNow access at all. Default.
- **connected** - read the resolved incident, draft, and submit with
  category and workflow state. Requires a ServiceNow MCP connection.
  Blocked on DEP-1; the article shape is identical, only the transport
  changes.

## Manual mode procedure

1. **Take the worklog as given.** Paste, ticket text, or dictated
   summary - whatever the user provides is the entire source. Do not
   supplement it from general knowledge of how similar issues are
   usually resolved.
2. **Select the template.** Site profile's article template if one is
   defined; otherwise references/kb-template.md, labeled generic.
3. **Order the article the way the ticket was worked.** Scope first,
   then the differential layers in the order triage rules them out -
   workstation/user, application (RIS/PACS), interface, advanced. Carry
   only the layers the worklog supports. A layer with nothing behind it
   is omitted and listed as outstanding.
4. **Draft section by section**, marking the Cause section's confidence
   explicitly (confirmed / likely / possible - the persona scale,
   applied to root cause). A worklog with no cause in it gets "cause not
   established," not a mark on a guess.
5. **Format for the importer.** references/servicenow-format.md governs
   heading levels, bold and monospace use, image references, callouts,
   and what silently degrades. Never invent an image src.
6. **Run the field checklist** (references/kb-template.md) before
   presenting the draft as done. A checklist item that can't be filled
   is marked unknown, not silently dropped.
7. **Write one self-contained file.** A single HTML file opening with
   the Word header from references/servicenow-format.md - openable in
   Word on a workstation with no interpreter installed. It goes where
   the user says, or the working directory; never inside this repo.
   scripts/html_to_docx.py renders the .docx in one step where an
   interpreter exists (macOS, Linux, WSL - offer it only after
   confirming; it is not the Windows path). Report any image left as a
   placeholder.
8. **Separate suggestions from the article.** Anything that would
   improve the article but isn't supported by the worklog goes in a
   clearly separate suggestions block underneath - in the response,
   never in the HTML, and therefore never in the .docx.

## Screenshots

Screenshots make a troubleshooting article usable, and a screenshot of a
production worklist or study list almost certainly contains patient
data. This skill does not ingest, redact, or de-identify it. Use the
exact image ID handed over, place it immediately after the step it
illustrates, and say plainly that whether a given screenshot can be
attached is the site's call under its own policy. If the answer is no,
keep drafting with placeholders.

## Gap detection and stale-article flagging (E7.4/E7.5)

Blocked on DEP-1 for live operation. Manual-mode shape: if the user
describes a recurring-sounding symptom or pastes several similar
tickets, say so explicitly and offer to draft a candidate article rather
than silently noting the pattern. Stale-article flagging: if the user
mentions a change or upgrade, ask whether any existing articles
reference the old configuration, rather than scanning a KB the skill
has no access to. The metadata line's version and date exist for
exactly this.

## Environment

The original plugin ran on an MSP-managed Windows workstation: no
Python, no pip, PowerShell as the shell. When this agent's runtime is
that workstation, three consequences, none optional:

- PowerShell syntax first, bash second. python3 is not a Windows
  command - the name resolves to a Store alias stub.
- The default output must work with nothing installed - that is why the
  article is Word-openable HTML rather than a script's output.
- Do not search the filesystem for the site profile. It lives at a path
  the user confirmed during onboarding. If the path isn't known in this
  session, ask for it. No profile and no answer means draft generically
  and say so.

## Rules

- Conform to the site's article template from the profile, not to a
  generic KB shape.
- Do not invent reproduction steps that were not in the worklog.
- The ladder is ordered by the triage differential, not by a generic
  troubleshooting script.
- Rendering is code's job, interpretation is not.

## Not this skill

Writing to ServiceNow. Rendering a .docx is a local file conversion,
not a state-changing action - the article still gets uploaded by a
human, and connected mode's submit path stays behind DEP-1 and an
explicit human approval either way (the kb_submission handoff,
../../../../DUTIES.md).

Deciding whether an article should exist at all, or approving one for
publication. This skill drafts and flags; the knowledge owner decides.

## References

- references/kb-template.md - article shape, layer names, field checklist
- references/servicenow-format.md - import mechanics: the Word HTML
  header, the routes to an uploadable file, what degrades, image and
  PHI handling
- scripts/html_to_docx.py - optional one-step HTML to DOCX renderer
  (PEP 723 header; uv run resolves python-docx and Pillow)
- examples/ in the parent repo - worked articles, including one that
  degrades to Step 1 alone because no incident underlies it
