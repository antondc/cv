# LaTeX Project

CV composed with LaTeX


## Required TeX Live packages

The following packages are required beyond the TeX Live core collections.


### Install command

```bash
tlmgr install \
  currvita \
  cfr-lm \
  nfssext \
  enumitem \
  xcolor \
  eso-pic \
  textcase \
  etoolbox \
  xkeyval \
  regexpatch \
  babel \
  epstopdf-base
```

## Build instructions

From the project root:

```bash
latexmk -pdf main.tex
```

To clean build artifacts:

```bash
latexmk -C
```
