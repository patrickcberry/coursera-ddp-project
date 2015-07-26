library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$amount <- renderPrint( input$amount )
    output$pfreq <- renderPrint( input$pfreq )    
    
    output$lplot <- renderPlot({

        #ppy - periods per year

        ppy <- 12
        
        if ( input$pfreq == "Weekly") {
            ppy <- 52
        } 

                if ( input$pfreq == "Annually" ) {
            ppy <- 1
        }
        
        # inital loan value    
        pv <- input$amount
        n  <- input$term * ppy          # number of periods
        r  <- input$rate / 100 / ppy    # rate per period
        
        # Payment per period
        p <- (r * pv) / ( 1 - (1 + r)^-n)

        period <- 0:n
        balance <- pv - 0:n * p
        
        plot(period,balance,type="n")
        lines(period,balance)
    })
    
    payment <- reactive({
        #ppy - periods per year
        
        ppy <- 12
        
        if ( input$pfreq == "Weekly") {
            ppy <- 52
        } 
        
        if ( input$pfreq == "Annually" ) {
            ppy <- 1
        }
        
        # inital loan value    
        pv <- input$amount
        n  <- input$term * ppy   
        r  <- input$rate / 100 / ppy  
        
        # Payment per period
        p <- (r * pv) / ( 1 - (1 + r)^-n)
    })
    
    output$payment <- payment
    
})