// Antonio Díaz CV

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
  #block(below: 8pt)[
    #grid(
      columns: (3fr, 1fr),
      align: (left, right),
      [
        #strong(department)
        #if location != [] [
          | #location]],
      time,
    )
  ]
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
    institution, time,
  )
]

#let intern-heading(company: [], location: [], time: []) = block(below: 10pt)[
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

#set text(font: "EB Garamond", size: 12pt, lang: "en", region: "us", hyphenate: false, kerning: false, number-type: "old-style")
#set par(justify: true, leading: 0.6em)

#show heading.where(level: 1): it => text(size: 14.5pt, weight: "regular", it.body)

#show list: it => {
  v(3pt, weak: false)
  it
}

// non-breaking hyphen, so names don't split across lines
#let nbh = "‑"

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
    #emph(link("mailto:hello@antoniodiaz.me")[hello\@antoniodiaz.me]) \
    #emph(link("https://antoniodiaz.me")[www.antoniodiaz.me]) \
    #emph(link("https://www.github.com/antoniodcorrea")[github/antoniodcorrea]) \
    #emph(link("https://www.linkedin.com/in/antonio-d%C3%ADaz-correa-b9487828/")[LinkedIn])
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
    Background as publisher directing design and production for editorial
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

    #intern-heading(company: [#link("https://thrivemarket.com/")[#smallcaps[Thrive Market]]/#link("https://distillery.com")[#smallcaps[Distillery]]], location: [Moscow (#sc[RU]) -- #sc[l.a.] (#sc[US])], time: [2019 -- 2022])
    Full stack developer. #emph(link("https://thrivemarket.com")[www.thrivemarket.com]): e‑commerce competing with Amazon Fresh in the #sc[US] market. \
    _Stack_: TypeScript, React, Cypress, Rust.
    - Synchronization with cross-functional teams across different time zones #box[(#sc[US] -- #sc[CEE/CIS]).]
    - Refactored web client to #link("https://nextjs.org/")[Next.js] over an 18-month migration, writing a full suite of #sc[E2E] tests with Cypress beforehand; all 32 views migrated or retired with no #sc[SEO] regression.
    - Implemented new modules related to different payment systems.
    - #sc[A/B] testing and experimentation with Amplitude.
    - Managed cleanup, shutdown, and replacement of legacy sites and endpoints, including infrastructure and redirections.

#block(breakable: false)[
    #intern-heading(company: [#link("https://astroshock.ru")[#smallcaps[Astroshock]]], location: [Moscow (#sc[RU])], time: [2017 -- 2019])
    Full stack developer. _Stack_: React, Backbone, Django (Python). Development of web client, back office for content management, and #sc[API]. \
    #emph(link("https://mosbrew.ru")[www.mosbrew.ru]), #emph(link("https://u.university/")[ww.u.university]), #emph(link("https://linii.group")[www.linii.group]).
]
    #intern-heading(company: [#smallcaps[Critik]], location: [Madrid (#sc[ES])], time: [2015 -- 2016])
    Founder and developer. Online book review platform. Led product vision and development. Built data pipeline built data pipeline against the Biblioteca Nacional de España (BNE) linked open data catalog via #link("https://www.w3.org/TR/rdf-sparql-query/")[#sc[SPARQL]] and #link("https://www.mysql.com/")[#sc[M]y#sc[SQL]]..

    #intern-heading(company: [#link("https://www.diazpons.es")[#smallcaps[Díaz \& Pons]]], location: [Madrid (#sc[ES])], time: [2012 -- 2015])
    Founder and editor. Publishing house focused on non-fiction. Directed overlapping design and production workflows across 20+ projects, coordinating authors, printers, and distributors. #emph(link("https://www.diazpons.es")[www.diazpons.es]).

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
    // fixed indent so the wrapped line under "Design" lines up
    #set terms(separator: [: ], hanging-indent: 37.82pt)
    / Languages: TypeScript, JavaScript, #link("https://www.rust-lang.org/")[Rust], #link("https://go.dev/")[Go], #sc[SQL].
    / Frontend: React, #link("https://nextjs.org/")[Next.js], #link("https://graphql.org/")[#sc[G]raph#sc[QL]], #link("https://www.framer.com/motion/")[Framer Motion].
    / Backend: Node.js, #link("https://www.postgresql.org/")[#sc[P]ostgre#sc[SQL]].
    / Architecture: Domain Driven Design, Hexagonal, #sc[REST].
    / Design: Component-Driven, #link("https://atomicdesign.bradfrost.com/")[Atomic], #link("https://m3.material.io/foundations/design-tokens/overview")[Tokens] and Material Design, Grid Systems.
    / Testing: Jest, #link("https://www.cypress.io/")[Cypress], #link("https://amplitude.com/")[Amplitude] (#sc[A/B]).
    / Tools: Git, GitLab, #sc[GitHub] Actions, Jenkins, Docker.
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
    #proj-heading(title: [Urligram], institution: [Bookmark and #sc[rss] manager. Web client, #sc[API], and browser extensions. Written in Go, Rust and TypeScript.\ #emph(link("https://www.urligram.com")[www.urligram.com]).], time: [])
    #proj-heading(title: [Transducers], institution:  [Functional programming series at #emph(link("https://www.antoniodiaz.me/blog/functional-javascript-transducers-14")[antoniodiaz.me]).], time: [])
    #proj-heading(title: [Hexagonal Rust], institution: [Rust #sc[REST] starter kit using hexagonal architecture. #emph(link("https://github.com/antoniodcorrea/rust-api-rest-starter-kit")[github.com]).], time: [])
  ],
)

#section-block(
  [Interests],
  title-offset: -2.88pt,
  title-align: right,
  [
    #link("https://glidingunion.eu")[Gliding: #sc[SPL] (Sailplane Pilot Licence)], based at Fuentemilanos aerodrome, Spain. \
    Reading: narrative nonfiction on history of technology, geography, and art.
  ],
)
