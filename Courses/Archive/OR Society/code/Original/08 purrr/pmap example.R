x <- list(1, 1, 1)
y <- list(10, 20, 30)
z <- list(100, 200, 300)

pmap(list(x, y, z), sum)

pmap(list(x, y, z), ~..1+..2+..3)

pmap(list(x, y, z), ~{
  browser()
  ..1+..2+..3}
  )
