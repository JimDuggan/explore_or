map_dbl(c(1,4,7),~.x+10)

map_dbl(c(1,4,7),~{.x+10})

map_dbl(c(1,4,7),~.+10)

modify_if(c(1,4,7),
          function (x) x > 5, 
          ~.x+10)





