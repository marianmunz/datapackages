# This server will bring data from yahoo by using the quantmod package
# we need the quantmod package installed
# The quantmod package for R is designed to assist the quantitative trader in the development,
# testing, and deployment of statistically based trading models
# the chart data will display bars for the standard open/high/low/close prices and
# it will also display trading volumes


library(quantmod)

shinyServer(function(input, output) {
#get the data from yahoo based on the inputs  
  dataInput <- reactive({
    getSymbols(input$symb, src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
#output the stock chart based on stock symbol data from yahoo  
  output$plot <- renderPlot({   
    data <- dataInput()
    
    
    chartSeries(data, theme = chartTheme("white"), 
                type = "candlestick", TA = 'addVo()')
  })
})
