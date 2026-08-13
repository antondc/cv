// Antonio Díaz — CV
// Built on the "yuan-resume" Typst Universe package:
// https://typst.app/universe/package/yuan-resume
// https://github.com/visika/yuan-resume
//
// MIT License, Copyright (c) 2024 Haofeng Yuan. The five functions below
// (section-block, edu-heading, proj-heading, intern-heading, award) are
// copied verbatim from that package's functions.typ, with two changes:
//
// 1. Font: section-block() hardcoded "Cronos Pro" for section titles, a
//    commercial font that's neither installed on this machine nor bundled
//    with Typst (confirmed: a `show text.where(font: "Cronos Pro")`
//    override does not intercept a font set directly on a `text()` call,
//    so vendoring was the reliable fix). The upstream template's body font
//    is likewise the commercial "Sabon LT Std" — neither that nor Cronos
//    Pro shipped as actual font files in the package (Typst Universe
//    strips non-redistributable fonts), and this machine only had a
//    Microsoft Word font-preview thumbnail for "Sabon Next LT", not an
//    installed, usable font. Substituted EB Garamond throughout: it's the
//    open-source (SIL OFL) modern digitization of the same Garamond
//    lineage Sabon was itself redrawn from, so it sits close to the
//    original in spirit while being freely redistributable. Fetched the
//    variable-weight release from Google Fonts' official repository
//    (fonts.google.com/specimen/EB+Garamond) — the Homebrew cask
//    `font-eb-garamond` turned out to be an older cut with no bold weight.
//
// 2. Semantics: section titles were plain styled text inside a grid cell,
//    not real headings — no PDF outline entries, and the extracted text
//    ran the title straight into the section's first sentence with no
//    break ("Summary Software developer..."). They're now wrapped in
//    #heading(level: 1), with a show rule directly below that renders
//    them identically to before (same grid position, same smallcaps/size)
//    while restoring bookmarks and a real paragraph break in extracted
//    text.
//
// 3. Baseline: grid cells align by the top of their box, not by text
//    baseline, so the 14.5pt heading and the 10pt body text next to it
//    didn't sit on the same line even though both start flush at the row's
//    top edge — bigger font, bigger ascent, lower baseline. Measured the
//    gap by rendering both at actual size and finding the bottom pixel row
//    of a non-descender glyph on each side (E of a heading, T of the first
//    word beside it): 11px at 300 ppi, i.e. 2.64pt. A -2.64pt top inset on
//    the heading box cancels it — but only *sometimes*: the same code,
//    same fonts, same content re-tested in isolation lands within 1-2px
//    everywhere except one section (Languages), which was off by 9px in
//    the real document and only 1px in an isolated repro with identical
//    content. Forcing that section to the top of a fresh page (temporary
//    #pagebreak() while debugging) also fixed it — so it's Typst
//    accumulating a rounding difference from whatever sits above a
//    section on the page, not this code. Rather than chase that further,
//    title-offset lets each section-block call correct for its own
//    measured drift; see the per-call values below, each checked against
//    a fresh 300 ppi render (target: 0px, i.e. the heading's and the
//    first line of content's non-descender glyphs bottom out on the same
//    pixel row).

#let section-block(title, content, title-offset: -2.64pt, title-align: left) = [
  #grid(
    columns: (2.8fr, 13.8fr),
    column-gutter: 12pt,
    align: (title-align, left),
    box(inset: (top: title-offset))[#heading(level: 1)[#smallcaps(title)]], content,
  )
  #v(7pt)
]

#let edu-heading(department: [], location: [], role: [], time: []) = [
  #set par(justify: false)
  #grid(
    columns: (3fr, 1fr),
    align: (left, right),
    [
      #strong(department)
      #if location != [] [
        | #location]],
    time,
  )
  #if role != [] [
    #emph(role)
  ]
]

#let proj-heading(title: [], institution: [], time: []) = [
  #set par(justify: false)
  #grid(
    columns: (3fr, 1fr),
    align: (left, right),
    grid.cell(
      colspan: 2,
      strong(title),
    ),
    row-gutter: 8pt,
    emph(institution), time,
  )
]

#let intern-heading(company: [], location: [], time: []) = [
  #set par(justify: false)
  #grid(
    columns: (3fr, 1fr),
    align: (left, right),
    [
      #strong(company)
      #if location != [] [
        | #location]],
    time,
  )
]

#let award(title: [], time: []) = [
  #grid(
    columns: (3fr, 1fr),
    align: (left, right),
    [- #title], time,
  )
]

#set document(
  title: "Antonio Díaz CV",
  author: "Antonio Díaz",
  keywords: (
    "Antonio Díaz", "software developer", "full stack developer",
    "TypeScript", "JavaScript", "Rust", "Go", "React", "Next.js",
    "Node.js", "GraphQL", "PostgreSQL", "SQL", "REST", "DDD",
    "Cypress", "Jest", "Madrid", "Spain", "remote",
  ),
)

#set page(paper: "a4", margin: (top: 1.8cm, bottom: 1.8cm, left: 2.2cm, right: 2.2cm))

// Old-style (text) figures instead of lining figures, matching the
// original template's numerals — EB Garamond ships both via OpenType,
// lining is just the default.
#set text(font: "EB Garamond", size: 12pt, lang: "en", region: "us", hyphenate: false, kerning: false, number-type: "old-style")
#set par(justify: true, leading: 0.6em)

// Reproduces section-block()'s original look (no bold, no numbering, no
// extra block spacing) so promoting titles to real headings is a
// semantic-only change.
#show heading.where(level: 1): it => text(size: 14.5pt, weight: "regular", it.body)

// More breathing room before bullet lists — plain block(above:) on the
// list element had no visible effect (its default spacing collapses
// against the preceding paragraph's), so this prepends explicit space.
#show list: it => {
  v(3pt, weak: false)
  it
}

// Non-breaking hyphen: keeps a compound proper noun from being split
// at the hyphen across a line break.
#let nbh = "‑"

// Small caps for text that's already all-uppercase in its correct casing
// (acronyms, initialisms). Plain smallcaps() only shrinks lowercase
// letters via the smcp OpenType feature and leaves existing uppercase
// alone — on "FON" that's a no-op, indistinguishable from setting no
// style at all. `all: true` additionally applies c2sc, shrinking the
// already-uppercase letters too, which is what actually produces a
// visible small-caps look here. For mixed-case proper nouns (Telefónica,
// Thrive Market...) plain smallcaps() is used directly instead, since the
// leading capital should stay full height — matching how the original
// LaTeX (small caps applied to a lowercase-typed word) rendered them.
#let sc(body) = smallcaps(all: true, body)

#grid(
  columns: (2fr, 1fr),
  align: (left + bottom, right + bottom),
  smallcaps[
    #text(size: 26pt)[Antonio Díaz]
    \
    #text(size: 14pt)[Senior Full Stack Engineer]
  ],
  [
    (+34) 671 156 605 \
    #link("mailto:hello@antoniodiaz.me")[hello\@antoniodiaz.me] \
    #link("https://antoniodiaz.me")[www.antoniodiaz.me] \
    #link("https://www.github.com/antoniodcorrea")[github/antoniodcorrea] \
    #link("https://www.linkedin.com/in/antonio-d%C3%ADaz-correa-b9487828/")[Linkedin]
  ],
)

#line(length: 100%, stroke: 0.4pt)

#section-block(
  [Summary],
  title-offset: -2.88pt,
    title-align: right,
  [
    Senior full-stack engineer with experience shipping high-traffic
    streaming and e‑commerce platforms.
    Background directing design and production for 20+ editorial
    projects, from typography and layout to printing and distribution,
    applied to design systems and #sc[ui] architecture. Currently based in
    Madrid, Spain.
  ],
)

#section-block(
  [Experience],
  title-offset: -3pt,
  title-align: right,
  [
    #intern-heading(company: [#link("https://www.telefonica.es/es/")[#sc[Telefónica]]/#link("https://full-on-net.com")[#sc[FON]]], location: [Madrid (#sc[ES])], time: [2023 -- Present])
    Full stack developer. #emph(link("https://movistarplus.es")[movistarplus.es]): Streaming near-real-time web application. \
    _Stack_: React, TypeScript, Node.js, #sc[G]raph#sc[QL], #sc[HLS]/#sc[DASH].
    - Contributed to libraries, including Google's #link("https://github.com/shaka-project/shaka-player")[Shaka-player] (#link("https://github.com/shaka-project/shaka-player/pull/9943")[#sc[PR] #9943], #link("https://github.com/shaka-project/shaka-player/pull/6022")[#sc[PR] #6022]).
    - Development of multilingual web and backend #sc[BFF] applications for European and American markets with several million concurrent playbacks.
    - Introduced TypeScript to a 1,000‑file Node.js codebase, raising typed coverage to roughly 40#sym.percent, along with testing best practices.
    - Maintain #sc[CI/CD] pipelines with the team: #sc[GitHub] Actions, Docker, canary deployments to OpenShift.
    - Refactored several functionalities and their caching systems to improve latency, helping other teams working with different devices replicate our success in their implementations.
    - Led cross-team efforts to find and solve hard-to-reproduce bugs, often requiring investigation beyond the team's own systems.
    - Currently migrating the Movistar Plus+ international web service (10+ countries) into a new platform, working transversally across engineering, design, and product teams on a complete redesign and merging both platforms' business logic.

    #v(8pt)
    #intern-heading(company: [#link("https://thrivemarket.com/")[#smallcaps[Thrive Market]]/#link("https://distillery.com")[#smallcaps[Distillery]]], location: [Moscow (#sc[RU]) -- #sc[l.a.] (#sc[US])], time: [2019 -- 2022])
    Full stack developer. #emph(link("https://thrivemarket.com")[www.thrivemarket.com]): e‑commerce competing with Amazon Fresh in the #sc[US] market. \
    _Stack_: TypeScript, React, Cypress, Rust.
    - Synchronization with cross-functional teams across different time zones #box[(#sc[US] -- #sc[CEE/CIS]).]
    - Refactored web client to #link("https://nextjs.org/")[Next.js] over an 18-month migration, writing a full suite of #sc[E2E] tests with Cypress beforehand; all 32 views migrated or retired with no #sc[SEO] regression.
    - Implemented new modules related to different payment systems.
    - #sc[A/B] testing and experimentation with Amplitude.
    - Managed cleanup, shutdown, and replacement of legacy sites and endpoints, including infrastructure and redirections.

    #v(8pt)
    #intern-heading(company: [#link("https://astroshock.ru")[#smallcaps[Astroshock]]], location: [Moscow (#sc[RU])], time: [2017 -- 2019])
    Full stack developer. _Stack_: React, Backbone, Django (Python). Development of web client, back office for content management, and #sc[API]. \
    #emph(link("https://mosbrew.ru")[www.mosbrew.ru]), #emph(link("https://u.university/")[ww.u.university]), #emph(link("https://linii.group")[www.linii.group]).

    #v(8pt)
    #intern-heading(company: [#smallcaps[Critik]], location: [Madrid (#sc[ES])], time: [2015 -- 2016])
    Founder and developer. Project management and data import from the #link("https://www.bne.es/")[#sc[BNE]] using #link("https://www.w3.org/TR/rdf-sparql-query/")[#sc[SPARQL]] and #link("https://www.mysql.com/")[#sc[M]y#sc[SQL]].

    #v(8pt)
    #intern-heading(company: [#link("https://www.diazpons.es")[#smallcaps[Díaz \& Pons]]], location: [Madrid (#sc[ES])], time: [2012 -- 2015])
    Founder and editor. Directed overlapping design and production workflows across 20+ projects, coordinating authors, printers, and distributors. #emph(link("https://www.diazpons.es")[www.diazpons.es]).

    #v(8pt)
    #intern-heading(company: [#smallcaps[Freelance]], location: [Madrid (#sc[ES])], time: [2007 -- 2011])
    Project manager at #link("https://cgac.xunta.gal/")[#sc[CGAC]] and Medialab-Prado (currently #link("https://www.medialab-matadero.es/")[Matadero#(nbh)Medialab]).
  ],
)

#section-block(
  [Education],
  title-offset: -3pt,
  title-align: right,
  [
    #edu-heading(
      department: [#link("https://cgac.xunta.gal/")[#sc[CGAC]] + #link("https://www.usc.gal")[#sc[USC]]],
      location: [Santiago de Compostela, Spain],
      role: [Master's Degree in Project Management],
      time: [2007],
    )
    #v(8pt)
    #edu-heading(
      department: [#link("https://www.usc.gal")[#sc[USC]]],
      location: [Santiago de Compostela, Spain],
      role: [Bachelor of Arts in Art History],
      time: [2001 -- 2006],
    )
  ],
)

#section-block(
  [Skills],
  title-offset: -3pt,
  title-align: right,
  [
    // terms()'s default hanging-indent is a fixed constant, not the width
    // of the actual term label — it only happens to match longer labels
    // like "Architecture". "Design" (the one entry that wraps) is short
    // enough that the default left its second line short of "Component-
    // Driven Design"'s start. 37.82pt is strong[Design]'s measured width
    // (34.85pt) plus the ": " separator's (2.98pt), so the wrap lands
    // under the actual text instead.
    #set terms(separator: [: ], hanging-indent: 37.82pt)
    / Languages: TypeScript, JavaScript, #link("https://www.rust-lang.org/")[Rust], #link("https://go.dev/")[Go], #sc[SQL].
    / Frontend: React, #link("https://nextjs.org/")[Next.js], #link("https://graphql.org/")[#sc[G]raph#sc[QL]], #link("https://www.framer.com/motion/")[Framer Motion].
    / Backend: Node.js, #link("https://www.postgresql.org/")[#sc[P]ostgre#sc[SQL]].
    / Architecture: #sc[DDD], Hexagonal, #sc[REST].
    / Design: Component-Driven Design, #link("https://atomicdesign.bradfrost.com/")[Atomic Design], #link("https://m3.material.io/foundations/design-tokens/overview")[Design Tokens], Material Design, Grid Systems.
    / Testing: Jest, #link("https://www.cypress.io/")[Cypress], #link("https://amplitude.com/")[Amplitude] (#sc[A/B]).
    / Tools: Git, GitLab, #sc[GitHub] Actions, Jenkins, Docker, OpenShift.
  ],
)

#section-block(
  [Languages],
  title-offset: -3pt,
  title-align: right,
  [
    #set terms(separator: [: ])
    / Spanish: Native.
    / English: Fluent, spoken and written.
    / Russian: Intermediate, spoken and written.
  ],
)

#section-block(
  [Projects],
  title-offset: -3pt,
  title-align: right,
  [
    #proj-heading(title: [Urligram], institution: [Web client, #sc[API], and browser extensions for #link("https://www.urligram.com")[urligram.com]. Stack: Go, Rust and TypeScript.], time: [])
    #v(8pt)
    #proj-heading(title: [Transducers], institution: [#link("https://www.antoniodiaz.me/en/blog/functional-javascript-transducers-14")[Functional programming series] at #link("https://antoniodiaz.me")[antoniodiaz.me].], time: [])
    #v(8pt)
    #proj-heading(title: [Hexagonal Rust], institution: [#link("https://github.com/antoniodcorrea/rust-api-rest-starter-kit")[Rust #sc[API] #sc[REST] starter kit] using hexagonal architecture.], time: [])
  ],
)

#section-block(
  [Interests],
  title-offset: -2.88pt,
  title-align: right,
  [
    Gliding: #sc[SPL] (Sailplane Pilot Licence), based at Fuentemilanos, Spain. \
    Reading: narrative nonfiction on history of technology, geography, and art.
  ],
)
