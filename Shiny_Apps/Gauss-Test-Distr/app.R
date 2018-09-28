#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library("shiny")
library("scales")

# Define UI for application that draws a histogram
# ui <- fluidPage(
#    
#    # Application title
#    #titlePanel("Gauss Test"),
#    
#    # Sidebar with a slider input for number of bins 
#    sidebarLayout(
#       sidebarPanel(
#         sliderInput(inputId = "n",       label = "Sample Size (n):",                    min = 10,  max = 250, value = 30),
#         sliderInput(inputId = "alpha",   label = HTML("Significance Level (&alpha;):"), min =0.01, max = 0.1, step=0.01, value = 0.05),
#         sliderInput(inputId = "mu.true", label = HTML("True Mean (&mu;):"),             min =  0,  max =   1, step=0.05, value = 0)
#       ),
#       
#       # Show a plot of the generated distribution
#       mainPanel(
#          plotOutput("distPlot")
#       )
#    )
# )

ui <- fluidPage(
  
  titlePanel("One Sided Z-Test"),
  
  fluidRow(
    
    column(12,
           wellPanel(
             sliderInput(inputId = "n",       label = "Sample Size (n):",                    min = 10,  max = 250, value = 30),
             sliderInput(inputId = "alpha",   label = HTML("Significance Level (&alpha;):"), min =0.01, max = 0.1, step=0.01, value = 0.05),
             sliderInput(inputId = "mu.true", label = HTML("True Mean (&mu;):"),             min =  0,  max =   1, step=0.05, value = 0)
           )       
    ),
    
    column(12,
           plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     ## Fixed values:
     sd       <- 1
     mu.0     <- 0
     ## From slider-inputs:
     n        <- input$n
     alpha    <- input$alpha
     mu.true  <- input$mu.true
     ## Prepage x- and y-data for density plots:
     xx.0     <- seq(mu.0 - 4, mu.0 + 4, length=1000)
     yy.0     <- dnorm(xx.0, mean=mu.0, sd=sd)
     mu.1     <- sqrt(n)*((mu.true - mu.0)/sd)
     xx.1     <- xx.0 + mu.1
     yy.1     <- yy.0
     ##
     yy.0 <- yy.0*10
     yy.1 <- yy.1*10
     ## Plotting:
     par(cex=1.5)#family = "serif", 
     plot(xx.0, yy.0, type="n", xlim=range(c(xx.0,xx.1)), ylim=c(0,9), #ylim=range(c(yy.0,yy.1)),
          ylab = "", xlab = "", axes=FALSE, main="")
     # mtext(side = 3, text = expression(paste("One Sided Z-Test",sep="")), line = 3, cex=1.3)
     if(mu.1==mu.0){
       mtext(side = 3, text = expression(paste("Under ",H[0],": ",mu[0]," = ",mu,sep="")), 
             line = 1, cex=1.3)
     }else{
       mtext(side = 3, text = expression(paste("Under ",H[1],": ",mu[0]<mu,sep="")), line = 1, cex=1.3)
     }
     axis(1, at = c(min(c(xx.0,xx.1)), mu.0, qnorm(1-alpha, mean=mu.0, sd=sd), max(c(xx.0,xx.1))), 
          labels = expression(-infinity, 0, z[1-alpha], infinity), cex=1.5)
     ## Print Null-distribution (gray area):
     polygon(x = c(min(xx.0), xx.0,   max(xx.0)), y = c(0, yy.0, 0), 
             col   =alpha("grey", 0.5), border=alpha("grey", 0.9))
     ##
     if(mu.1==mu.0){
       ## The blue area: Type I error
       lb <- round(qnorm(1-alpha, mean=mu.0, sd=sd),2)
       ub <- max(xx.0)
       slct <- xx.0 >= lb & xx.0 <= ub
       polygon(c(lb,xx.0[slct],ub), c(0,yy.0[slct],0), col=alpha("red", 0.7), border=alpha("red", 0.7))
     }else{
       ## The red area: Type II error
       lb <- min(xx.1)
       ub <- round(qnorm(1-alpha, mean=mu.0, sd=sd),2)
       slct <- xx.1 >= lb & xx.1 <= ub
       polygon(c(lb,xx.1[slct],ub), c(0,yy.1[slct],0), col=alpha("darkorange2", 0.7), border=alpha("darkorange2", 0.7))
       ## The green area: Power
       slct <- xx.1 >= ub
       polygon(c(ub,xx.1[slct],max(xx.1)), c(0,yy.1[slct],0), 
               col=alpha("darkgreen", 0.5), border=alpha("darkgreen", 0.9))
       lines(x = rep(ub,2), y=c(0,max(c(dnorm(ub, mean=mu.0, sd=sd),dnorm(ub,mean=mu.1,sd=sd)))),lwd=.5)
     }
     ## Legends
     ## Legend on the right
     if(mu.1==mu.0){
       legend("topright", title=NULL, 
              legend = c(paste0("P(Type I Error) = μ = ",round(alpha,digits=2)," "),
                         "",
                         "Null Distribution: N(0,1)",
                         paste0("True Distribution: N(",round(mu.1,digits=1),",1)")),
              pch=c(-1,-1,22,22),pt.lwd=c(0,0,0,0),pt.cex=c(1,1,1.65,1.65),
              pt.bg  = c(gray(0.5,alpha=0), gray(0.5,alpha=0), alpha("red", 0.7),   alpha("red", 0.7)),
              fill   = c(alpha("red", 0.7), gray(0.5,alpha=0), gray(0.5,alpha=0.4), gray(0.5,alpha=0.4)), 
              border = c(alpha("red", 0.7), gray(0.5,alpha=0), gray(0.5,alpha=0.4), gray(0.5,alpha=0.4)), 
              bg     = gray(0.5,alpha=0.05), box.col = gray(0.5,alpha=0.05))
     }else{
       legend("topright", title=NULL,
              legend  = c(paste0("P(Type II Error) = ",round(pnorm(q=qnorm(1-alpha, mean=mu.0, sd=sd),mean = mu.1,sd=sd),digits=3)," "), 
                          paste0("Power = ", round(1- pnorm(q=qnorm(1-alpha, mean=mu.0, sd=sd),mean = mu.1,sd=sd),digits = 3)," "),
                          "",
                          "Null Distribution: N(0,1)",
                          paste0("True Distribution: N(",round(mu.1,digits=1),",1)")), 
              pch=c(-1,-1,-1,-1,22),pt.lwd=c(0,0,0,0,0),pt.cex=c(1,1,1,1,1.65),
              pt.bg  = c(gray(0.5,alpha=0), gray(0.5,alpha=0), gray(0.5,alpha=0), gray(0.5,alpha=0), alpha("darkgreen", 0.7)),
              fill   = c(alpha("darkorange2", 0.7), alpha("darkgreen", 0.5), 
                         gray(0.5,alpha=0), gray(0.5,alpha=0.4), alpha("darkorange2", 0.7)), 
              border = c(alpha("darkorange2", 0.7), alpha("darkgreen", 0.5), 
                         gray(0.5,alpha=0), gray(0.5,alpha=0.4), alpha("darkorange2", 0.7)), 
              bg     = gray(0.5,alpha=0.05), box.col = gray(0.5,alpha=0.05))
     }
     ## Legend on the left
     legend("topleft", title=NULL,
            legend = c("Fixed values:   ",
                       expression(paste(mu[0]," = 0")),
                       expression(paste(sigma,"  = 1"))), 
            bg     = gray(0.5,alpha=0.05), box.col = gray(0.5,alpha=0.05))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

