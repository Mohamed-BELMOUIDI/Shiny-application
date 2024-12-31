
# server.R
library(shiny)

server <- function(input, output) {
    # Reactive expression to process input data
    data <- reactive({
        # Split input string by commas and convert to numeric
        nums <- as.numeric(unlist(strsplit(input$numbers, ",")))
        # Remove NA values (from invalid input)
        nums <- nums[!is.na(nums)]
        return(nums)
    })
    
    # Output: Statistical summary
    output$stats <- renderPrint({
        nums <- data()
        
        if(length(nums) == 0) {
            return("Please enter valid numeric data")
        }
        
        if(input$analysisType == "basic") {
            # Basic statistics
            list(
                Mean = mean(nums),
                Median = median(nums),
                "Standard Deviation" = sd(nums)
            )
        } else {
            # Detailed statistics
            summary(nums)
        }
    })
    
    # Output: Histogram
    output$histogram <- renderPlot({
        nums <- data()
        
        if(length(nums) > 0) {
            hist(nums,
                 main = "Histogram of Input Data",
                 xlab = "Value",
                 col = "lightblue",
                 border = "white")
        }
    })
}

