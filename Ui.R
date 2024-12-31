
# ui.R
library(shiny)

ui <- fluidPage(
    titlePanel("Basic Data Analysis Tool"),
    
    # Documentation section at the top
    wellPanel(
        h3("Application Documentation"),
        p("This application helps you analyze numeric data. Here's how to use it:"),
        tags$ol(
            tags$li("Enter numbers in the text box, separated by commas (e.g., 1,2,3,4,5)"),
            tags$li("Select the type of analysis you want to perform"),
            tags$li("The results will automatically update in the right panel"),
            tags$li("You can also visualize your data through a histogram")
        ),
        p("Note: Invalid inputs will be ignored. Make sure to only enter numbers and commas.")
    ),
    
    sidebarLayout(
        sidebarPanel(
            # Input: Text box for numeric data
            textInput("numbers", 
                     label = "Enter numbers (comma-separated):",
                     value = "1,2,3,4,5"),
            
            # Input: Radio buttons for analysis type
            radioButtons("analysisType",
                        label = "Choose analysis type:",
                        choices = list("Basic Statistics" = "basic",
                                     "Detailed Statistics" = "detailed")),
            
            # Input: Checkbox for showing histogram
            checkboxInput("showHist",
                         label = "Show histogram",
                         value = TRUE)
        ),
        
        mainPanel(
            # Output: Statistical summary
            h4("Statistical Summary"),
            verbatimTextOutput("stats"),
            
            # Output: Histogram (conditional on checkbox)
            conditionalPanel(
                condition = "input.showHist == true",
                plotOutput("histogram")
            )
        )
    )
)

