library(shiny)
#header<-dashboardHeader(title ="Widget to simulate T-test on data")
shinyUI(pageWithSidebar(
  headerPanel("Study design simulation widget: Choose sample size, mean and SD for control and test groups"),
  sidebarPanel(
    p("This shiny widget can be used to simulate data to obtain information about suitable 
      sample size based on expected mean and SD values in a control and test dataset of equal 
      size. Based on this informaton, the widget performs a two-sided T-test and prints out 
      the statistics for the simulated data."),
    
          sliderInput(inputId="c_n", 
                label = "Sample size:", 
                value = 500, min= 10, max= 1000),
    sliderInput(inputId="c_mean", 
                label = "Mean of control:", 
                value = 100, min= 0, max= 1000),
    sliderInput(inputId="c_sd", 
                label = "SD in control:", 
                value = 10, min= 0, max= 100),
    
    sliderInput(inputId="t_mean", 
                label = "Mean of test:", 
                value = 150, min= 0, max= 1000),
    sliderInput(inputId="t_sd", 
                label = "SD in test:", 
                value = 10, min= 0, max= 100)
    
    
  ),
  mainPanel(
    plotOutput("plot1"),
   
    verbatimTextOutput("ttest")
  
  )
))