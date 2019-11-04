  mu <- 3
  sigma <-1.5
  R <- 10000
  n <- seq(from=2, to=30, by=2)
  
  s_mat <- matrix(NA, nrow = length(n), ncol = R)
  s_mat_tilde <- matrix(NA, nrow = length(n), ncol = R)
  
  MSE <- matrix(NA, nrow = length(n), ncol = 1) 
  MSE_tilde <- matrix(NA, nrow = length(n), ncol = 1) 
  
  Bias_sq <- matrix(NA, nrow = length(n), ncol = 1)
  Bias_sq_tilde <- matrix(NA, nrow = length(n), ncol = 1)
  
  Var <- matrix(NA, nrow = length(n), ncol = 1)
  Var_tilde <- matrix(NA, nrow = length(n), ncol = 1)
  
  
  for (i in 1:length(n)) {
    for (r in 1:R) {
      x_vec <- rnorm(n[i], mean = mu, sd = sigma)
      x_bar <-mean(x_vec)
      s_mat[i,r] <-sqrt(1/n[i]*sum((x_vec - x_bar)^2))
      s_mat_tilde[i,r] <-sqrt(1/(n[i]-1)*sum((x_vec - x_bar)^2))
    }
    MSE[i] <- 1/R*sum((s_mat[i,] - sigma)^2)
    MSE_tilde[i] <- 1/R*sum((s_mat_tilde[i,] - sigma)^2)
    Bias_sq[i] <- (mean(s_mat[i,]) - sigma)^2
    Bias_sq_tilde[i] <- (mean(s_mat_tilde[i,]) - sigma)^2
    Var[i] <- 1/R*sum((s_mat[i,] - mean(s_mat[i,]))^2)
    Var_tilde[i] <- 1/R*sum((s_mat_tilde[i,] - mean(s_mat_tilde[i,]))^2)
  }
  
  df <- data.frame("n" = n, "MSE" = MSE, "Bias2" = Bias_sq, "Var" = Var,
                   "MSE_tilde" = MSE_tilde, "Bias2_tilde" = Bias_sq_tilde, "Var_tilde" = Var_tilde)
  
  library(magrittr)
  library(dplyr)
  library(plotly)
  
  p <- plot_ly(df, x = ~n, y = ~MSE, name = 'MSE_biased_estimator', type = 'scatter', mode = 'lines',
               line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
    add_trace(y = ~Bias_sq, name = 'Squared_Bias_biased_estimator', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
    add_trace(y = ~Var, name = 'Variance_biased_estimator', line = list(color = 'rgb(0, 139, 69)', width = 4)) %>%
    add_trace(y = ~MSE_tilde, name = 'MSE_unbiased_estimator', line = list(color = 'rgb(205, 12, 24)', width = 4, dash = 'dash')) %>%
    add_trace(y = ~Bias_sq_tilde, name = 'Squared_Bias_unbiased_estimator', line = list(color = 'rgb(22, 96, 167)', width = 4, dash = 'dash')) %>%
    add_trace(y = ~Var_tilde, name = 'Variance_unbiased_estimator', line = list(color = 'rgb(0, 139, 69)', width = 4, dash = 'dash')) %>%
    layout(title = "",
           xaxis = list(title = "n"),
           yaxis = list (title = ""))
  print(p)
  