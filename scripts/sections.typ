#set heading(numbering: (..n) => if n.pos().len() == 1 {
  "Section " + numbering("1", ..n) + ":"
} else {
  numbering("1.1", ..n)
})
