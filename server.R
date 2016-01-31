library(shiny)
library(ggplot2)
library(reshape2)
shinyServer(function(input, output) {
                     
                # Create datasets from slider input              
                df.m<- reactive({
                 
                 Control<-  rnorm(input$c_n, input$c_mean,input$c_sd)
                 Test<-rnorm(input$c_n, input$t_mean,input$t_sd)
                 df<-data.frame(Control,Test)
                #df<-data.frame(rnorm(input$c_n, input$c_mean,input$c_sd),
                                 # rnorm(input$c_n, input$t_mean,input$t_sd))
                df.m<-melt(df)   
                })
                
                #Create a t-test based on data from slider input
                
                ttest<-reactive({
                        Control<-rnorm(input$c_n, input$c_mean,input$c_sd)
                        Test<-rnorm(input$c_n, input$t_mean,input$t_sd)       
                   ttest<-t.test(Control,Test, var.equal=FALSE)
                        
                })
                #Create plot based on data input from sliders
                output$plot1<- renderPlot({ 
                        ggplot(df.m()) + geom_density(aes(x = value,
                        colour=variable))
                })
                
                #Create printout of T-test
                output$ttest <- renderPrint({
                        t<-ttest()
                        t
                })
        }
)