#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(ggplot2)

app_data <- read_rds("app_data")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Foreign Direct Investment and Child Labor"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
     x %>%
       select(labour1014rate) %>% 
       ggplot(aes(x = labour1014rate)) + geom_histogram(bins = input$bins) + ggtitle("Global Child Labour Rates")

   })
}

# Run the application 
shinyApp(ui = ui, server = server)

