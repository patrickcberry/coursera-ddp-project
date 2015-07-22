library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Loan Calculator"),
    sidebarPanel(
        h3('Loan Details'),
        numericInput( 'amount', 'Loan amount:', 250000, min = 1 ),
        selectInput(  'pfreq', 'Payment frequency:', c('Weekly', 'Monthly', 'Annually'), selected = 'Monthly', multiple = FALSE),
        numericInput( 'rate', 'Interest rate (%):', 4.5, min = 0.01, step = 0.1 ),
        sliderInput(  'rateSlider', '' , min = 0.1, max = 15, 4.5, step = 0.1 ),
        numericInput( 'term', 'Loan term (years):', 20, min = 1, step = 1 ),
        sliderInput(  'termSlider', '' , min = 1, max = 30, 20, step = 1 )
    ),
    mainPanel(
        h3('Results'),
        verbatimTextOutput( "oamount" ),
        verbatimTextOutput( "opfreq" )
    )
))