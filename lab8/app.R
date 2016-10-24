# advertising scatterplots

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

library(shiny)
advertising = read.csv("advertising.csv")

ui <- fluidPage(
  
  # Title for the page
  headerPanel('Advertising Plots of Sales Vs. Specific Media Budgets'),
  sidebarPanel(
    
    # Dropdown for user to select either TV, Radio, or Newspaper as x variable
    selectInput('xcol', 'Media Budget', names(advertising)[2:4])
  ),
  
  # Adds panel that shows the plotted output
  mainPanel(
    plotOutput('plot')
  )
)

server <- function(input, output) {

  # Grabs only the selected x column from above and Sales from advertising
  selectedData <- reactive({
    advertising[, c(input$xcol, "Sales")]
  })

  # Plots Sales vs the selected x column and saves it as reactive output object
  output$plot <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         pch = 20, cex = 2)
  })
}

shinyApp(ui = ui, server = server)
