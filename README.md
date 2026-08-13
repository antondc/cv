# CV Antonio Díaz Correa

CV composed with [Typst](https://typst.app) — chosen because it produces a
tagged PDF (with PDF/UA-1 conformance available) by default, so the text
layer parses correctly in ATS systems, LLM ingestion pipelines, and
screen readers. The prior LaTeX version's small-caps and icon glyphs
extracted as garbled/unreadable text.

## Build instructions

Requires the `typst` CLI (`brew install typst`).

```bash
typst compile antonio_diaz_cv.typ antonio_diaz_cv.pdf --pdf-standard ua-1
```

The `--pdf-standard ua-1` flag enforces PDF/UA-1 accessibility
conformance at compile time — the build fails with a diagnostic instead
of silently producing a non-conformant PDF.

## Cover letter

Same toolchain, same font (EB Garamond), different layout — a letter, not
a CV, so no label-column grids.

```bash
typst compile antonio_diaz_cover.typ antonio_diaz_cover.pdf --pdf-standard ua-1
```
