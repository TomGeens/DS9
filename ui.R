# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/

library(shiny)

shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("John's Welding Fume Data"),
        
        # Sidebar with a slider input for number of bins
        sidebarPanel(
                p("This app visualises histograms of subsamples from a dataset of 25 welding fume measurements", a("(Evans, Ingle, Molyneux, Sharp and Swain, 1979):", href="https://annhyg.oxfordjournals.org/content/22/1/1.abstract",target="_new")),
                tags$ul(
                        tags$li("with the slider, you can sample (without replacement) n measurements from this dataset,"),
                        tags$li("each time you change the slider and press the submit button, a new random subsample is drawn.")
                ),
                sliderInput("n",
                            "Number of samples:",
                            min = 1,
                            max = 25,
                            value = 12),
                checkboxInput("curve", "show lognormal and normal curves", FALSE),
                submitButton("Submit")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
                plotOutput("plot",height=600,width=800),
                textOutput("text")
        )
))
