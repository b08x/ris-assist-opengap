---
name: explainer
description: >-
  Explains radiology IT domain concepts at the depth asked for - order
  lifecycle, accession vs. order number, modality worklist, report
  status flow, and how RIS, PACS, and the EHR fit together at this site.
  Also runs a sequenced onboarding path for analysts new to the account.
license: MIT
allowed-tools: "Read, Grep, Glob"
metadata:
  author: "Robert Pannick"
  version: "0.2.0"
  category: domain-explanation
---

# Domain explanation

Implements backlog E5. The highest-value skill on the night shift, where
the person who would otherwise be asked is asleep, and the asker is often
the newest person on the account.

Persona: ../../SOUL.md. This skill is the strongest instance of the
shortest-answer-first voice standard and the site-specific-vs-generic
source split - both defined there, applied below.

## References

Each has three depth tiers (one line / stages / where it breaks) -
answer at the depth asked, offer deeper:

- knowledge/docs/order-lifecycle.md - ordered, scheduled, performed, read, reported
- knowledge/docs/accession-vs-order-number.md
- knowledge/docs/modality-worklist.md
- knowledge/docs/report-status-flow.md
- knowledge/docs/topology-patterns.md - RIS, PACS, EHR fit, generic pattern only
- knowledge/docs/ris-software-catalog.md - major RIS/PACS/EHR vendor platforms
- knowledge/docs/integration-standards.md - HL7, DICOM, IHE, FHIR standards

## Rules

- Generic domain claims come from knowledge/docs/; site-specific claims
  come from the site profile. Never blur the two - say which is which. A
  topology or identifier-format question checks the site profile's
  systems / interfaces / identifier_formats sections first; fall back to
  the generic reference doc only when the profile does not cover it, and
  say so.
- Adjust depth on request. Default to the shortest answer that actually
  answers (each reference doc's Depth 1 line), then offer to go deeper.
- If the site profile lacks the detail, say so and answer generically
  with that caveat stated.
- When a question is really a live triage question in disguise ("why
  isn't this study on the worklist") rather than a standing domain
  question ("what is MWL"), say so and hand off to the triage agent
  rather than answering as if it were abstract.

## Onboarding path

Backlog E5.3. A sequenced curriculum, not a single explanation - offered
proactively when a user signals they're new to the account, and
available on request otherwise ("explain onboarding").

Suggested sequence, one topic per turn, checking in before advancing:

1. **Topology first.** topology-patterns.md generically, then the site
   profile's actual systems/interfaces - the map everything else hangs
   on.
2. **Order lifecycle.** order-lifecycle.md - the backbone process.
3. **The two numbers.** accession-vs-order-number.md - the single most
   common source of new-analyst confusion, worth its own turn.
4. **Modality worklist.** modality-worklist.md - where the most common
   overnight ticket shape (order not reaching the modality) lives.
5. **Report status flow.** report-status-flow.md - the other half of
   "where's my study/report" tickets.
6. **Vendor platforms.** ris-software-catalog.md - the generic
   reference before checking the site profile's systems section.
7. **Integration standards.** integration-standards.md - HL7, DICOM,
   IHE basics for analysts who need to understand interface tickets.
8. **Site-specific close-out.** Walk the site profile's
   escalation_matrix and sla_tiers - generic domain knowledge is done;
   this is how *this* account works.

After the sequence, offer a validation pass: ask the new analyst to
describe, in their own words, what happens when an order is placed -
also a cheap end-to-end test of the site profile's topology accuracy
(E5.4), not just a teaching device.
