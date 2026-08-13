// Antonio Díaz — Cover letter
// Same typographic system as antonio_diaz_cv.typ (EB Garamond, old-style
// figures, no kerning artifacts, real link text) but its own layout: a
// letter, not a CV, so no label-column grids — just a header block, a
// dateline, and justified prose, the way the original .tex laid it out.
// Text content and tone carried over unchanged from antonio_diaz_cover.tex.

#set document(
  title: "Antonio Díaz Cover Letter",
  author: "Antonio Díaz",
)

#set page(paper: "a4", margin: (top: 3.5cm, bottom: 3cm, left: 3cm, right: 3cm))

#set text(font: "EB Garamond", size: 12pt, lang: "en", region: "us", hyphenate: false, kerning: false, number-type: "old-style")
#set par(justify: true, leading: 0.65em, spacing: 1.1em)

#let sc(body) = smallcaps(all: true, body)

#align(left)[
  #smallcaps[#text(size: 24pt)[Antonio Díaz]]

  #text(size: 12.5pt, style: "italic")[Senior Full Stack Engineer]
]

#v(0.5em)
#align(right)[#datetime.today().display("[month repr:long] [day], [year]")]
#v(1.5em)

Senior full-stack engineer with 9+ years of experience on frontend using #link("https://www.typescriptlang.org")[TypeScript] and #link("https://reactjs.org/")[React], and on backend with #link("https://nodejs.org")[Node.js], plus #link("https://www.rust-lang.org")[Rust] and #link("https://go.dev")[Go] on smaller projects.

Since 2015 I have been working on full stack roles related to web software development with multinational teams across wide time zones. Some of the sites I have worked on include the multinational streaming platform from #link("https://www.telefonica.es/")[Telefónica] #link("https://www.movistarplus.es/")[Movistar Plus+], the ecommerce site based in Los Angeles _#link("https://www.thrivemarket.com")[Thrive Market]_ or the site for the design studio _#link("https://linii.ru/en")[Linii]_.

In 2012 I co-founded _#link("https://www.diazpons.es")[Díaz #sym.amp Pons]_, publishing house focused on digital and printed editions, where we edited high quality non-fiction books on art and social sciences. There I directed content and personally designed every book's interior: typography, layout, and composition, which gave me a strong eye for visual detail and design language.

Recently I have been integrating a multilingual international streaming service with several million concurrent plays into the main streaming platform #link("https://www.movistarplus.es/")[Movistar Plus+]. This has involved a complete redesign of the platform, merging the frontend logic of both services, dealing with scale and security challenges, refining product details, and coordinating across engineering, design, and product teams to solve problems that cut across organizational boundaries.

I am open to roles related to web software development with #link("https://www.typescriptlang.org")[TypeScript] or #link("https://reactjs.org/")[React]. You can find more information at my site _#link("https://antoniodiaz.me")[www.antoniodiaz.me]_, in my _#link("https://www.git.antoniodiaz.me/antoniodcorrea/")[GitLab]_ | _#link("https://github.com/antoniodcorrea")[GitHub]_ | _#link("https://www.linkedin.com/in/antonio-d%C3%ADaz-correa-b9487828/")[LinkedIn]_, or by writing to _#link("mailto:hello@antoniodiaz.me")[hello\@antoniodiaz.me]_.

#v(1.5em)
Antonio Díaz
