# advertising scatterplots

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

library(shiny)
advertising = read.csv("advertising.csv")

ui <- fluidPage(
  headerPanel('Advertising Plots of Sales Vs. Specific Media Budgets'),
  sidebarPanel(
    selectInput('xcol', 'Media Budget', names(advertising)[2:4])
  ),
  mainPanel(
    plotOutput('plot')
  )
)

server <- function(input, output) {

  selectedData <- reactive({
    advertising[, c(input$xcol, "Sales")]
  })

  output$plot <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         pch = 20, cex = 2)
  })
}

shinyApp(ui = ui, server = server)
