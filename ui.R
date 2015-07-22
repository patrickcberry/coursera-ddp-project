library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("[Application Title]"),
    sidebarPanel(
        h3('Sidebar Text')
    ),
    mainPanel(
        h3('Main Panel Text')
    )
))