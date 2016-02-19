# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/

library(shiny)
wf<-c(8.8,3.9,7.3,17.0,23.1,6.7,5.2,4.8,2.5,5.8,4.2,27.9,1.0,6.9,20.5,5.3,25.2,19.1,8.5,6.0,15.0,25.8,14.6,9.2,11)

shinyServer(function(input, output){
        output$plot <- renderPlot({
                # generate sample based on input$n from ui.R
                x <- sample(wf,input$n)
                par(mfrow=c(2,1))
                myhist1 <- hist(x,ylim=c(0,10),height=300,width=800,xlab="Welding fume concentration in mg/m³")
                multiplier1 <- myhist1$counts / myhist1$density
                mydensity1 <- density(x)
                mydensity1$y <- mydensity1$y * multiplier1[1]
                myx1<-sort(x)
                mymean1<-mean(log(x))
                mysd1<-sd(log(x))
                abline(v=exp(mymean1), col = "red", lwd = 2)
                text(x=exp(mymean1),y=9,paste("mean(x) = ",round(exp(mymean1),2)),pos=4)
                myp951<-qnorm(0.95,mean=mymean1,sd=mysd1)
                abline(v=exp(myp951), col = "red", lwd = 2)
                text(x=exp(myp951),y=9,paste("p95(x) = ",round(exp(myp951),2)),pos=4)
                
                # plot lognormal curve if box is checked
                if (input$curve==TRUE) {
                        sd_x1 <- seq(min(x),max(x), by = mysd1/100)
                        sd_y1 <- dlnorm(x = sd_x1, mean = mymean1, sd = mysd1) * multiplier1[1]
                        lines(sd_x1,sd_y1, col = "blue", lwd = 2)
                }    
        
                myhist2 <- hist(log(x),ylim=c(0,10),height=300,width=800,xlab="log(Welding fume concentration in mg/m³")
                multiplier2 <- myhist2$counts / myhist2$density
                mydensity2 <- density(log(x))
                mydensity2$y <- mydensity2$y * multiplier2[1]
                myx2<-sort(log(x))
                mymean2<-mean(log(x))
                mysd2<-sd(log(x))
                abline(v=mymean2, col = "red", lwd = 2)
                text(x=mymean2,y=9,paste("mean(log(x)) = ",round(mymean2,2)),pos=4)
                myp952<-qnorm(0.95,mean=mymean2,sd=mysd2)
                abline(v=myp952, col = "red", lwd = 2)
                text(x=myp952,y=9,paste("p95(log(x)) = ",round(myp952,2)),pos=4)
                
                # plot normal curve if box is checked
                if (input$curve==TRUE) {
                        sd_x2 <- seq(log(min(x)),log(max(x)), by = mysd2/100)
                        sd_y2 <- dnorm(x = sd_x2, mean = mymean2, sd = mysd2) * multiplier2[1]
                        lines(sd_x2,sd_y2, col = "blue", lwd = 2)
                }
                output$text <- renderText(x)  
        })
        
})