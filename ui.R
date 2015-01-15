
library(shiny)

# Define UI for application that shows when and where Food Trucks in San Francisco are open
shinyUI(pageWithSidebar(
      
      # Application title
      headerPanel("San Francisco Food Truck Locater"),
      
      # Sidebar with a slider input for what time of day you'd like to see availability for.
      sidebarPanel(
            
            sliderInput("Hour",
                        "When are you hungry?",
                        min = 0,
                        max = 23,
                        value = 0)
            ),
      
      # Show a plot of the food trucks that are available at that time and their locations
      mainPanel(
            plotOutput("myPlot")
            )
      ))