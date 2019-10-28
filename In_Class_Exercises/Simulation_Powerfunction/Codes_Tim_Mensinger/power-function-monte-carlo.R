library(tidyverse)
library(parallel)
library(pbapply)

###################################################################################################
### Preliminaries

## 1
simulate_data <- function(N=100, 
                          params=list(loc=0, scale=1, df=NULL), 
                          distr=rnorm) {
  # N : sample size
  # params : hyperparameters for the distribution 
  #  - loc : location (mean)
  #  - scale : spread (standard deviation)
  #  - df : degrees of freedom
  # distr : random variable generator (distribution func) 
  
  loc   <- params$loc
  scale <- params$scale
  df    <- params$df
  
  if (!is.null(df)) {
    X <- distr(n=N, loc, scale, df=df)
  } else {
    X <- distr(n=N, loc, scale) 
  }
  
  X
}

## 2
compute_z_statistic <- function(X, mu_0, sigma) sqrt(length(X)) * (mean(X) - mu_0) / sigma

## 3
test_decision <- function(statistic, alpha, qdistr, df) {
  # statistic : computed test statistic 
  # alpha : significance level 
  # qdistr : distribution function from which quantiles are calculated 
  # df : degrees of freedom of distribution function
  
  if (is.null(df)) {
    ifelse(abs(statistic) > qdistr(1 - alpha / 2), 1L, 0L)  
  } else {
    ifelse(abs(statistic) > qdistr(1 - alpha / 2, df=df), 1L, 0L)  
  }
}

## single monte carlo sim
single_monte_carlo_simulation <- function(args, key, value) {
  ## Computes a single monte carlo draw for given simulation arguments 
  # args : list of arguments used for simulation and evaluation
  # key : character string indicating which variable value should be replaced by value
  # value : ^ 
  
  N      <- args$N
  params <- args$params
  distr  <- args$distr
  df     <- args$df
  mu_0   <- args$mu_0
  alpha  <- args$alpha
  qdistr <- args$qdistr
  
  assign(key, value)
  
  X <- simulate_data(N=N, params=params, distr=distr)
  z_statistic <- compute_z_statistic(X=X, mu_0=mu_0, sigma=params$scale)
  
  as.integer(test_decision(statistic=z_statistic, alpha=alpha, qdistr=qdistr, df=df))
}

single_monte_carlo_given_mu <- function(NSIM, args, key, value) {
  mean(sapply(1:NSIM, function(k) single_monte_carlo_simulation(args=args, key=key, value=value)))
}

###################################################################################################
### Actual Simulation Code 

complete_monte_carlo_sim <- function(args, mu_grid, NSIM=2*1e3) {
  # args : list of arguments used for simulation and evaluation
  # NSIM : number of monte carlo draws for each mu_0
  # MU_GRID_SIZE : length of grid containing different mu_0 values
  
  
  # Take care of randomness during parallelization 
  set.seed(1)
  RNGkind("L'Ecuyer-CMRG")
  number_of_cores <- parallel::detectCores()
  cluster <- parallel::makeForkCluster(number_of_cores)
  parallel::clusterSetRNGStream(cluster, 1)
  
  pbapply::pboptions(type="timer", char="=")
  power_ <- pbapply::pblapply(mu_grid,
                              function(mu) {
                                single_monte_carlo_given_mu(NSIM, args, "mu_0", mu)
                                })
  stopCluster(cluster)
  
  unlist(power_)
}


###################################################################################################
### Plotting the Power Function 

# Parameters
MU_GRID_SIZE <- 1e3
mu_grid <- seq(-2, 2, le=MU_GRID_SIZE)
args    <- function(N) {
  list(N=N, 
       params=list(loc=0, scale=1, df=NULL), 
       distr=rnorm,
       qdistr=qnorm,
       df=NULL, 
       mu_0=0, 
       alpha=0.05) 
}

# Simulation
N_GRID <- c(10, 15, 25, 50)
NSIM  <- 1e3 
power_mat <- sapply(N_GRID, function(N) complete_monte_carlo_sim(args(N), mu_grid, NSIM))
colnames(power_mat) <- as.character(N_GRID)

df <- as_tibble(power_mat)
df <- df %>% mutate(mu = mu_grid) %>% gather(N, power, -c(mu)) %>% mutate(N = as.factor(N))

plt <- ggplot(df, aes(y=power, x=mu)) + 
  geom_line(aes(col=N), size=1) + 
  geom_hline(yintercept=args(0)$alpha, size=0.5) +
  theme_minimal() + 
  scale_colour_manual(values=c("#999999", "#E69F00", "#56B4E9", "#009E73",
                               "#F0E442", "#0072B2", "#D55E00", "#CC79A7")) + 
  annotate("text", x=-1.75, y=args(0)$alpha + 0.05, parse=TRUE,
           label=paste("alpha == ", args(0)$alpha), size=6)
plt

