library(deSolve)
library(dplyr)
library(purrr)
library(ggpubr)


# We define the model within a function.
sirh <- function(time, stocks, auxs){
  with(as.list(c(stocks, auxs)),{
    N <- S + I + R + H
    IR <- beta*I*S/N*M  
    VR <- v*S
    RR <- (1-hf)*gamma*I
    AR <- hf*gamma*I
    DR <- d*H 
    
    dS_dt  <- - IR - VR
    dI_dt  <-  IR - AR - RR
    dH_dt  <-  AR - DR
    dR_dt  <-  RR + DR + VR
    dM_dt  <- (M_min - M) * alpha
    return (list(c(dS_dt,dI_dt,dH_dt,dR_dt,dM_dt), 
                 Beta=beta, 
                 Gamma=gamma,
                 HF=hf,
                 V=v,
                 Alpha=alpha,
                 M_Min=M_min,
                 Infections=IR,
                 Recovering=RR,
                 Vaccinated=VR,
                 Hospitalised=AR,
                 Discharged=DR,
                 CheckSum=S + I + R + H))
  })
}

# We define an extra function to run the model. This is useful, as we can then call
# this many times for sensitivity analysis
run_scenario <- function(run_id=1,
                         stocks=c(S=9999,I=1,H=0,R=0,M=1),
                         simtime=seq(0,50,by=0.25),
                         beta=1,
                         gamma=0.25,
                         alpha=0.5,
                         M_min=0.3,
                         d=0.1,
                         hf=0.1,
                         v=0.1){
  auxs <- c(beta=beta,gamma=gamma,alpha=alpha,M_min=M_min,d=d,hf=hf,v=v)
  
  res <- ode(y=stocks, 
             times=simtime, 
             func = sirh, 
             parms=auxs, 
             method="euler") %>%
         data.frame() %>%
         as_tibble() %>%
         mutate(RunID=as.integer(run_id)) %>%
         select(RunID, everything())
}
 

# Defining the range of parameters to be varied
alpha_vals <- seq(0,.20,length.out=50)
vacc_vals  <- seq(0,0.05,length.out=50)
sim_inputs <- expand.grid(alpha_vals,vacc_vals)


run_id <- 1

# Use map2 to run all the 2500 simulations
sim_res <- map2(sim_inputs[,1],sim_inputs[,2],~{
  res <- run_scenario(run_id = run_id,
                      alpha = .x,
                      v = .y,
                      simtime = seq(0,75,by=0.25),
                      hf = 0.10)
  run_id <<- run_id + 1
  res
}) %>% bind_rows()
sim_res


# Gather the results and plot graphs
p1 <- ggplot(sim_res,aes(x=time,y=Infections,colour=RunID,group=RunID))+geom_line()+
  scale_colour_gradientn(colors=rainbow(14))+
  theme(legend.position = "none")+
  labs(title="Infections (flow)")+
  theme(title = element_text(size=9))
p1

p2 <- ggplot(sim_res,aes(x=time,y=H,colour=RunID,group=RunID))+geom_line()+
  scale_colour_gradientn(colors=rainbow(14))+
  theme(legend.position = "none")+
  labs(title="People in hospital (stock)")+
  theme(title = element_text(size=9))
p2

# Get quantile values for exploring trajectories
time_h <- sim_res %>%
  group_by(time) %>%
  summarise(MeanH=mean(H),
            Q95=quantile(H,0.95),
            Q05=quantile(H,0.05))

p3 <- ggplot(time_h,aes(x=time,y=MeanH))+geom_line()+
       geom_ribbon(aes(x=time,ymin=Q05,ymax=Q95),alpha=0.4,fill="steelblue2")+
       labs(title="90% quantiles for people in hospital")+
       theme(title = element_text(size=9))

g1 <- ggarrange(p1,p2,p3,nrow = 3)

# Get max peak values for policy space analysis
max_h <- sim_res %>%
           group_by(RunID) %>%
           summarise(MH=max(H),
                     V=first(V),
                     Alpha=first(Alpha))


p4 <- ggplot(max_h,aes(x=Alpha,y=V,colour=MH,size=MH))+geom_point()+
  scale_color_gradient(low="blue", high="red")+
  theme(legend.position = "none")+
  labs(title=paste0("Parameter Analysis"))+
  labs(subtitle=paste0("Max peak = ",round(max(max_h$MH),0)," at point (0,0)"))+
  theme(title = element_text(size=9))
  

p6 <- ggplot(max_h,aes(x=Alpha,y=V,z=MH))+geom_contour_filled()+
  labs(title=paste0("Contour plot"))+
  labs(subtitle=paste0("Yellow band range (450,500]"))+
  theme(title = element_text(size=9))+
  theme(legend.position = "none")

p7 <- ggplot(max_h,aes(x=Alpha,y=V,z=MH))+geom_contour_filled()+
  labs(title=paste0("Parameter Analysis"))+
  labs(subtitle=paste0("Contour plot"))+
  theme(title = element_text(size=9))

g2 <- ggarrange(p4,p6,nrow = 1)



