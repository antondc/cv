# CV Antonio Díaz Correa

CV composed with [Typst](https://typst.app), producing a tagged PDF (with
PDF/UA-1 conformance available) by default, so the text layer parses
correctly in ATS systems, LLM ingestion pipelines, and screen readers.

## Installation

Requires the `typst` CLI and `make`.

```bash
brew install typst
```

`make` ships with Xcode Command Line Tools on macOS and with most Linux
distributions. For other platforms, see the
[Typst installation docs](https://github.com/typst/typst#installation).

## Build

```bash
make
```

Every build enforces PDF/UA-1 accessibility conformance
(`--pdf-standard ua-1`); it fails with a diagnostic instead of silently
producing a non-conformant PDF.

## Live preview while editing

```bash
make watch
```

## Cover letter

Same toolchain, same font (EB Garamond), different layout: a letter, not
a CV, so no label-column grids.
