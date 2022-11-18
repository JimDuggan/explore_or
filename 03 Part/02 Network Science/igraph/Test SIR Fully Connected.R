library(igraph)
library(purrr)

# Some functions from igraph
# Get the vertices
# v <-  V(g)
# Get the edges
# e <- E(g)
# x <- as_edgelist(g)
# node_list <- as_ids(V(g))


format_num <- function(num,n=2){
  s <- paste0("%0",n,"d")
  sprintf(s,num)
}

# SEED <- 100
# set.seed(SEED)
avr_contacts <- 3
N <- 16
init_states <- sample(c("S","I","R"),
                      size = N,
                      replace = T,
                      prob = c(.6,.2,.2))

# Make a fully connected graph
g      <- make_full_graph(N)
agents <- paste0("A",format_num(1:N))
g      <- set_vertex_attr(g,"name", value = agents)
g      <- set_vertex_attr(g,"state", value = init_states)

V(g)$color <- case_when(
                 V(g)$state=="S" ~ "green",
                 V(g)$state=="I" ~ "red",
                 TRUE ~ "yellow")


plot(g,vertex.size=20)


walk(as_ids(V(g)),~{
  neighbours <- adjacent_vertices(g,.x)
  ids <- names(neighbours[[1]])
  r_ids <- sample(ids,min(N-1,rpois(1,avr_contacts)))
  cat("Node = ",.x,"with ",length(r_ids)," contacts\n")
  walk(r_ids,~{
   cat("\t",.x,"\n")
  })
  
  # to_del <- setdiff(ids,r_ids)
  # g <-delete_edges(g,to_del) 
  
})

l <-layout.grid(g)
plot(g,layout=l)

x <- E(g)
# index <- which(attr(E(g),"vnames") %in% c("A01|A02"))
# E(g)$color[index] <- "blue"
# E(g)$width[index] <- 3

g <- set_edge_attr(g,"color",E(g)[1:30],"red")
# g <- set_edge_attr(g,"width",E(g)[1:30],2)
g <- set_edge_attr(g,"color",E(g)[-(1:30)],"grey")

l <-layout.grid(g)
plot(g,layout=l)










