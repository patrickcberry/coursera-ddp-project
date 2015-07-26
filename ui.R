library(shiny)

shinyUI(fluidPage(
    
    titlePanel("Loan Calculator"),
    
    sidebarLayout(
        sidebarPanel(
            h3('Loan Details'),
            numericInput( 'amount', 'Loan amount:', 250000, min = 1 ),
            selectInput(  'pfreq', 'Payment frequency:', c('Weekly', 'Monthly', 'Annually'), selected = 'Monthly', multiple = FALSE),
            # numericInput( 'rate', 'Interest rate (%):', 4.5, min = 0.01, step = 0.1 ),
            sliderInput(  'rate', 'Interest rate (%):' , min = 0.1, max = 15, 4.5, step = 0.1 ),
            # numericInput( 'term', 'Loan term (years):', 20, min = 1, step = 1 ),
            sliderInput(  'term', 'Loan term (years):' , min = 1, max = 30, 20, step = 1 ),
            h3('Instructions'),
            p('Eneter the Loan Details above and the application will calculate the payment (principle + interest) per period specified')
        ),
        
        mainPanel(
            h3('You Entered:'),
            p('The loan amount that you eneter was:'),
            verbatimTextOutput( "amount" ),
            p('The payment frequency that you eneterd was:'),
            verbatimTextOutput( "pfreq" ),
            h2('Payment:'),
            p('The payment (principle + interest) per period is:'),
            verbatimTextOutput( "payment" ),
            plotOutput("lplot")
        )
    )
))