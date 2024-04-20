# Chapter 14: Agent Based Simulation, the PA/A model

library(dplyr)
library(glue)
library(purrr)
library(igraph)
library(ggplot2)
library(tidyr)
library(furrr)

# Based on the graph from igraph, this creates a 
# tibble containing all the links for each agent
# Network links are represented from both directions
create_network_df<- function(df){
  network_df1 <- tibble(FromAgent=as.integer(df[,1]),
                        ToAgent=as.integer(df[,2]))
  network_df2 <- tibble(FromAgent=as.integer(df[,2]),
                        ToAgent=as.integer(df[,1]))
  
  network_df <- bind_rows(network_df1, network_df2) %>%
    arrange(FromAgent,ToAgent)
  network_df
}

# To improve performance, the network structure
# is split into a list of tibbles. Max size = number of agents
# Agents with no connections store a NULL value
network_to_list <- function(N,net){
  agent_net <- vector(mode="list",length=N)
  names(agent_net) <- as.character(1:N)
  contacts <- group_split(net,FromAgent)
  names(contacts) <- map_chr(contacts,~first(as.character(.x$FromAgent)))
  for(nam in names(contacts)){
    agent_net[[nam]] <- contacts[[nam]]
  }
  agent_net
}


generate_random_network <- function(N=1000,edge_mult=2,seed=F,seedVal=100){
  if(seed) set.seed(seedVal)
  graph       <- sample_gnm(n=N,m=N*edge_mult)
  gr_df       <- data.frame(get.edgelist(graph))
  net_df      <- create_network_df(gr_df) 
  sim_network <- network_to_list(N,net_df)
  list(N=N,
       graph=graph,
       # graph_df=gr_df,
       # network_df=net_df,
       network=sim_network)
}


run_sim <- function(run_id=1,
                    net,
                    adopters=c(1),
                    end_time=50,
                    prob_spread=0.10,
                    seed=FALSE,
                    seed_val=100){
  if(seed) set.seed(seed_val)
  
  agent_ids <- 1:net$N
  
  agents <- tibble(
    run_id              = rep(run_id,length(agent_ids)),
    sim_time            = rep(0L,length(agent_ids)),
    agent_id            = agent_ids,
    num_connections     = rep(0L,length(agent_ids)),
    pa_state            = rep(FALSE,length(agent_ids)),
    a_state             = rep(FALSE,length(agent_ids)),
    change_to_a         = rep(FALSE,length(agent_ids)),
    change_state_time   = rep(NA,length(agent_ids))
  )
  
  # Initialise agents state
  agents[,"num_connections"] <- as.integer(degree(net$graph))
  agents[agents$agent_id %in% adopters,"pa_state"]    <- FALSE
  agents[agents$agent_id %in% adopters,"a_state"]       <- TRUE
  agents[!(agents$agent_id %in% adopters),"pa_state"]   <- TRUE
  agents[!(agents$agent_id %in% adopters),"a_state"]    <- FALSE
  agents[agents$agent_id==adopters,"change_state_time"] <- 0L
  
  transitions <- tibble(
    agent_id        = integer(),
    sim_time        = integer(),
    state_pa_to_a   = logical()
  )
  
  transitions <- add_row(transitions,
                         sim_time=0L,
                         agent_id=as.integer(adopters),
                         state_pa_to_a=TRUE)
  
  time <- 1:end_time
  
  agents$run_id <- run_id
  trace_sim <- agents
  
  for(t in time){
    agents$sim_time <- as.integer(t)
    pa_list <- agents[agents$pa_state==TRUE & agents$num_connections > 0,
                      "agent_id",drop=T]
    
    if(length(pa_list) > 0){
      
      for(a in pa_list){
        neighbours <- net$network[as.character(a)][[1]][,"ToAgent",drop=T]
        neigh_adopters <- agents[agents$agent_id %in% neighbours & 
                                   agents$a_state ==TRUE,"agent_id",
                                 drop=T]
        
        lambda <- 1 - (1 - prob_spread) ^ length(neigh_adopters)
        rn <- runif(1)
        if(rn < lambda ){
          agents[agents$agent_id==a,"change_to_a"] <- TRUE
          agents[agents$agent_id==a,"change_state_time"] <- t
        }
      }
      
      # End of day --> Now Flip states for those that have changed from pa to a
      targets <- agents[agents$change_to_a==TRUE,"agent_id",drop=TRUE] 
      agents[agents$change_to_a==TRUE,"pa_state"]     <- FALSE
      agents[agents$change_to_a==TRUE,"a_state"]      <- TRUE
      agents[agents$change_to_a==TRUE,"change_to_a"]  <- FALSE
      
      # Log the flip event, logical useful for summations later
      transitions <- add_row(transitions,
                             sim_time=as.integer(t),
                             agent_id=as.integer(targets),
                             state_pa_to_a=TRUE)
      
    }
    
    # Append agents states to overall list
    trace_sim <- bind_rows(trace_sim,
                           agents)
  }
  
  agent_sim_full <- left_join(trace_sim,
                              transitions,
                              by=c("sim_time","agent_id"))
  
}


#----------------------------------------------------------------------------------
single_run <- function(){
  print(glue("Starting single run at {Sys.time()}"))
  net <- generate_random_network(1000,seed=T)
  res <- run_sim(net      = net,
                 end_time = 100)
  
  print(glue("Ending single run at {Sys.time()}"))
  
  ar <- res %>%
    group_by(run_id,sim_time) %>%
    summarise(Adoptions=sum(state_pa_to_a,na.rm = T)) %>%
    ungroup()
  
  p1 <- ggplot(ar,aes(x=sim_time,y=Adoptions))+geom_point()+geom_line()
  
  states <- res %>% 
    group_by(run_id,sim_time) %>% 
    summarise(PA=sum(pa_state),A=sum(a_state)) %>%
    pivot_longer(PA:A,
                 names_to = "State",
                 values_to = "Number")
  
  p2 <- ggplot(states,aes(x=sim_time,y=Number,colour=State,fill=State))+geom_area()
  
  not_adopted <- res %>% 
    filter(sim_time==80,pa_state==TRUE) %>%
    pull(num_connections) %>%
    table()
  
  list(res=res, ar=ar, p1 = p1, p2 = p2)
  
}

#----------------------------------------------------------------------------------
multiple_runs_synch <- function(N){
  print(glue("Starting multiple synch run at {Sys.time()}"))
  net <- generate_random_network(1000,seed=T)
  conns <- degree(net$graph)
  
  inits <- c(Lowest=which(conns == 1)[1], 
             Highest=which(conns == max(conns))[1],
             Mean=which(conns == floor(mean(conns)))[1])
  
  res <- map2(1:N,rep(inits,N/3),~run_sim(run_id   = .x,
                                          net      = net,
                                          adopters = .y,
                                          end_time = 100)) %>%
    bind_rows()
  
  print(glue("Ending multiple synch run at {Sys.time()}"))
  
  ar <- res %>%
    group_by(run_id,sim_time) %>%
    summarise(Adoptions=sum(state_pa_to_a,na.rm = T)) %>%
    mutate(run_desc=case_when(
      run_id %%  3 == 1 ~ "Lowest Connections",
      run_id %% 3 == 2 ~ "Highest Connections",
      run_id %% 3 == 0 ~ "Mean Connections")) %>%
    ungroup()
  
  
  p1 <- ggplot(ar,aes(x=sim_time,y=Adoptions,group=run_id,colour=run_desc))+geom_point()+geom_line()
  
  
  states <- res %>% 
    group_by(run_id,sim_time) %>% 
    summarise(PA=sum(pa_state),A=sum(a_state)) %>%
    mutate(run_desc=case_when(
      run_id %%  3 == 1 ~ "Lowest Connections",
      run_id %% 3 == 2 ~ "Highest Connections",
      run_id %% 3 == 0 ~ "Mean Connections")) %>%
    pivot_longer(PA:A,
                 names_to = "State",
                 values_to = "Number")
  
  p2 <- ggplot(states,aes(x=sim_time,y=Number,colour=State,fill=State))+geom_area()+facet_wrap(~run_desc)
  
  
  # change times
  
  ct <- res %>%
    filter(!is.na(change_state_time)) %>%
    select(run_id,agent_id,change_state_time) %>%
    distinct()
  
  p3 <- ggplot(ct,aes(x=change_state_time,y=agent_id,colour=as.factor(run_id)))+geom_point(size=0.6)
  
  
}


#----------------------------------------------------------------------------------
multiple_runs_asynch <- function(N){
  print(glue("Starting multiple asynch run at {Sys.time()}"))
  net <- generate_random_network(1000,seed=T)
  conns <- degree(net$graph)
  
  inits <- c(Lowest=which(conns == 1)[1], 
             Highest=which(conns == max(conns))[1],
             Mean=which(conns == floor(mean(conns)))[1])
  
  # plan(multisession, workers=future::availableCores())
  plan(multisession)
  
  N <- 30
  
  res <- future_map2(1:N,rep(inits,N/3),~run_sim(run_id   = .x,
                                                 net      = net,
                                                 adopters = .y,
                                                 end_time = 80),
                     .options = furrr_options(seed = T)) %>%
    bind_rows()
  
  print(glue("Ending multiple asynch run at {Sys.time()}")) 
  
  ar <- res %>%
    group_by(run_id,sim_time) %>%
    summarise(Adoptions=sum(state_pa_to_a,na.rm = T)) %>%
    mutate(run_desc=case_when(
      run_id %%  3 == 1 ~ "Lowest Connections",
      run_id %% 3 == 2 ~ "Highest Connections",
      run_id %% 3 == 0 ~ "Mean Connections")) %>%
    ungroup()
  
  
  p1 <- ggplot(ar,aes(x=sim_time,y=Adoptions,group=run_id,colour=run_desc))+
    geom_point()+geom_line()+facet_wrap(~run_desc,nrow = 3)
  
  quants <- ar %>% 
    group_by(run_desc,sim_time) %>%
    summarise(Q05=quantile(Adoptions,0.05),
              Q95=quantile(Adoptions,0.95),
              Mean=mean(Adoptions)) %>%
    ungroup()
  
  p4 <- ggplot(quants,aes(x=sim_time,y=Mean,colour=run_desc,group=run_desc))+
    geom_ribbon(aes(ymin=Q05,ymax=Q95,fill=run_desc,group=run_desc),alpha=0.2)+
    geom_line(size=2)
  
  states <- res %>% 
    group_by(run_id,sim_time) %>% 
    summarise(PA=sum(pa_state),A=sum(a_state)) %>%
    mutate(run_desc=case_when(
      run_id %%  3 == 1 ~ "Lowest Connections",
      run_id %% 3 == 2 ~ "Highest Connections",
      run_id %% 3 == 0 ~ "Mean Connections")) %>%
    pivot_longer(PA:A,
                 names_to = "State",
                 values_to = "Number")
  
  p2 <- ggplot(states,aes(x=sim_time,y=Number,colour=State,fill=State))+geom_area()+facet_wrap(~run_desc)
  
  
  # change times
  
  ct <- res %>%
    filter(!is.na(change_state_time)) %>%
    select(run_id,agent_id,change_state_time) %>%
    distinct()
  
  p3 <- ggplot(ct,aes(x=change_state_time,y=agent_id,colour=as.factor(run_id)))+geom_point(size=0.6)
  
  
  list(res=res,
       ar=ar,
       quants=quants,
       states=states,
       p1=p1,
       p2=p2,
       p3=p3,
       p4=p4)
}


ex_01 <- single_run()

ex_01$p1
ex_01$p2

ex_02 <- multiple_runs_asynch()








