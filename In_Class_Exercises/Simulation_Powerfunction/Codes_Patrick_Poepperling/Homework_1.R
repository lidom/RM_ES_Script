#Powerfunction - Version: 20.10.2019
library("tidyverse")

#Function that returns a vector around mu_0 
mu_vec <- function(mu_0){
  mu_upper <- seq (from = mu_0, to = mu_0+0.1, by=0.01)
  mu_lower <- seq (from = mu_0-0.1, to = mu_0, by=0.01)
  mu <- unique(sort(c(mu_lower, mu_upper)))
}

#Powerfunction that returns a vector with beta-Values
powerfunction <- function(mu_0, sigma, alpha, n, R){
  #Create a vetor around mu_0
  mu <- mu_vec(mu_0)
  
  #Create an empty Matrix that will hold the D-values for different levels of mu
  D_mat <- matrix(nrow = R, ncol = length(mu))
  
  #Create an empty vector that will hold the beta-values
  b_vec <- integer(length(mu))
  
  #Fill the Matrix and the beta-vector
  for (m in 1:length(mu)) {
    for (r in 1:R) { 
      data <- rnorm(n, mu[m], sigma)
      Zobs <- (sqrt(n)*(mean(data)- mu_0))/sigma
      Zcrit <- qnorm(p = 1-alpha/2)
      if(abs(Zobs) > Zcrit) {
        D_mat[r,m] <- 1
      } else {
        D_mat[r,m] <- 0
      } 
    } 
    b_vec[m] <- mean(D_mat[,m])
  }
  
  return(b_vec)
}

#Function to create a dataset for different levels of mu and n
createData <- function(mu_0, n, alpha){
  ret <- data.frame("mu" = mu_vec(mu_0), 
                    "bet"= powerfunction(mu_0=mu_0, sigma=0.1, alpha=alpha, n=n, R=10000))
  return (ret)
}

#Function to plot the powerfunction for a given n
plotTest <- function(mu_0, n, alpha){
  
  da <- createData(mu_0, n, alpha)
  ggplot(data=da, aes(x=da$mu, y=da$bet)) +
    geom_line() +
    geom_hline(yintercept=alpha, lty=3) +
    geom_text(aes(x=mu_0+0.05, y=alpha+0.02, 
                  label=paste('alpha==', toString(alpha), sep="")), 
              parse=TRUE, size=5) +
    labs(
      title = paste('Powerfunction of the two-sided Z-Test with n=',
                    toString(n), 
                    sep=""),
      x = expression(mu),
      y = expression(beta)
    ) + 
    theme_bw()
}

#Function to plot the powerfunction for two different n's 
#to compare the results
plotTwoTests <- function(mu_0, n_1, n_2, alpha){
  da_1 <- createData(mu_0, n_1, alpha)
  da_2 <- createData(mu_0, n_2, alpha)
  da <- data.frame("mu"=da_1$mu, "bet_1" =  da_1$bet, "bet_2" = da_2$bet)
  ggplot(data=da, aes(x=da$mu, y=da_1$bet)) +
    ylim(0,1) +
    geom_line(aes(y = da$bet_1, colour = "darkblue")) +
    geom_line(aes(y = da$bet_2, colour = "red")) +
    scale_color_discrete(labels = c("n_1", "n_2")) +
    geom_hline(yintercept = alpha, lty = 3) +
    geom_text(aes(x = mu_0 + 0.05, y = alpha + 0.02, 
                  label = paste('alpha == ', toString(alpha), sep = "")), 
              parse = TRUE, size = 5) +
    labs(
      title  =  paste('Powerfunction with n_1 = ',
                    toString(n_1), 
                    'and n_2 = ',
                    toString(n_2),
                    sep = " "),
      x  =  expression(mu),
      y  = expression(beta)
    ) + 
    theme_bw()
  
}


#Drawing, choose either one of the two functions.
#plotTest(0, 35, 0.1)
plotTwoTests(mu_0 = 0, n_1 = 15, n_2 = 30, alpha = 0.05)
