// Major sections start on a new page
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  it
}

// Heading size and spacing
#show heading: set block(above: 1.6em, below: 0.8em)
#show heading.where(level: 1): set text(size: 18pt)

// Code blocks and text diagrams: shaded box, kept on one page
#show raw.where(block: true): it => block(
  breakable: false,
  width: 100%,
  fill: luma(245),
  inset: 10pt,
  radius: 3pt,
  text(size: 8.5pt, it),
)

// Tables: roomier cells, bold header row
#set table(inset: 7pt)
#show table.cell.where(y: 0): strong

// Links in a muted blue
#show link: set text(fill: rgb("#1a4f8b"))
