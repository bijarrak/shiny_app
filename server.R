#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- cars[cars$speed<=input$sp, ] 
    
    plot(x$speed,x$dist, xlab = "Speed",ylab="Distance",main = "Speed Vs Dist")
    abline(lm(x$dist~x$speed),col="blue",lwd=2)
    
  })
  output$Predict<-renderText({
    test2<-matrix(data=c(input$sp,5),nrow=1,ncol = 2,dimnames = list("Predicted Distance",c("speed","dist")))
    model1<-lm(dist~speed,cars)
    test2<-as.data.frame(test2)
    predict(model1,newdata=test2)
  })
  
})
