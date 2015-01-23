
# this creates an UI for user to explore stock chart data for various stock symbols
# for various date intervals

library(shiny)

shinyUI(fluidPage(
  titlePanel("Stock Charts"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock symbol and a time period to see the chart 
        Information will be collected from yahoo finance. Data go back to 2013-01-01."),
  #input stock symbol - default is AAPL for Apple, Inc.from January 1, 2015 to current date 
      textInput("symb", "Symbol", "AAPL"),
  #input dates  
      dateRangeInput("dates", 
        "Date range",
        start = "2015-01-01", 
        end = as.character(Sys.Date())),
  #request stock chart 
      actionButton("get", "Get Stock Chart")
      
     
    ),
  
    #display the stock chart
    mainPanel(plotOutput("plot"))
  )
))