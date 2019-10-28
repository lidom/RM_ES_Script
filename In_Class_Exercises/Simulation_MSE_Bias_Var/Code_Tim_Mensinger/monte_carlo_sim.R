library(tidyverse, quietly=TRUE)

## Functions 

simulate_data <- function(n, mu, sigma) {
  # returns matrix n x k
  
  rnorm(n, mean=mu, sd=sigma)
}


monte_carlo_general <- function(n, mu, sigma, biased) {
  data <- simulate_data(n, mu, sigma)
  
  if (biased) return((n-1) * sd(data) / n)
  else return(sd(data))
}

monte_carlo <- function(R=1e4, n, mu=3, sigma=1.5, biased=TRUE) {
  # specific function 
  mc_func <- function(l) monte_carlo_general(n=n, mu=mu, sigma=sigma, biased)
  
  # monte carlo draws
  results <- sapply(1:R, mc_func)
  
  # compute metrics
  mse_  <- mean((results - sigma) ** 2)
  bias_ <- (mean(results) - sigma) ** 2
  var_  <- mean((results - mean(results)) ** 2)
  
  c(mse=mse_, bias=bias_, var=var_)
}


## Actual Simulation 

n_grid <- seq(2, 30)

rslt_bias <- t(sapply(n_grid, function(n) monte_carlo(n=n)))
rslt_unbias <- t(sapply(n_grid, function(n) monte_carlo(n=n, biased=FALSE)))

df1 <- rslt_bias %>% as_tibble() %>% mutate(n=n_grid) %>%
  gather(measure, value, -c(n)) %>% 
  #mutate(measure = paste0(measure, "_bias")) %>%
  mutate(measure=as.factor(measure))

df2 <- rslt_unbias %>% as_tibble() %>% mutate(n=n_grid) %>%
  gather(measure, value, -c(n)) %>% 
  #mutate(measure = paste0(measure, "_unbias")) %>%
  mutate(measure=as.factor(measure))

df_bool <- bind_cols(df1, df2) %>% select(-c(n1, measure1)) %>% 
  gather(biased, value, -c(n, measure)) %>% 
  mutate(biased = (biased == "value"))

df_long <- bind_rows(df1 %>% mutate(measure = paste0(measure, "_bias")), 
                     df2 %>% mutate(measure = paste0(measure, "_unbias")))
  

ggplot(df_bool, aes(y=value, x=n)) + 
  geom_line(aes(col=measure, linetype=biased), size=1.5, alpha=0.85) + 
  theme_minimal() + 
  scale_colour_manual(values=c("#999999", "#E69F00", "#56B4E9")) + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
