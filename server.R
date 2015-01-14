
library(shiny)
library(ggmap)

# Generate the blank map
map.center <- geocode("San Francisco, CA")
sfmap <- qmap(c(lon = map.center$lon, lat = map.center$lat), source = "google", zoom = 12)

# Read the data
data <- read.csv("foodTruckData_clean.csv") # Change to hit the API

# Define server logic required to generate and plot the data on the map.
shinyServer(function(input, output) {
      
      plotData <- reactive({
            d <- subset(data, start24 <= input$Hour & end24 >= input$Hour)
            return(d)
      })
      
      output$myPlot <- renderPlot({
            
            sfmap + geom_point(
                  aes(x = Longitude,
                      y = Latitude,
                      colour = Applicant,
                      size = 10,
                      alpha = .5),
                  data = plotData()) +
                  theme(legend.position = "") +
                  ggtitle(expression(atop(bold("San Francisco Food Truck Availability"),
                                          atop(italic("Use the slider to the left to see what's open when you're hungry"), ""))))
            
            
            })
            
      })

