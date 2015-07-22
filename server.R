library(shiny)

shinyServer(
    function(intput,output){
        output$oamount <- renderPrint({input$amount})
        output$opfreq <- renderPrint({input$pfreq})
    }
)