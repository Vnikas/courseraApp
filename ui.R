library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Fitting Models to the IRIS dataset"),
        sidebarPanel(
                h3("Tune the Model"),
                selectInput("id1", "Select Predictor:",
                            c("Displacement" = 3,
                              "Gross horsepower" = 4,
                              "Weight" = 6)),
                sliderInput("id2", "Select Model's degree", 
                            value = 1, 
                            min = 1, 
                            max = 4, 
                            step = 1),
                submitButton("Fit Model!")
                
                
                
        ),
        mainPanel(

                withMathJax(),
        
        
                tabsetPanel(
                        tabPanel(
                                h4("Fitted Model"),
                                plotOutput("oid1")),
                        
                        tabPanel( h4("Explanatory Text"), 
                                p(" "),  
                                p("This app gives a fast visual represantation of 
                                several regression models to the ", code("IRIS"), " dataset."),
                                
                                p("The dependent variable will always going to be ", 
                                  code("mpg"),"."),
                                
                                p("The user can choose one out of three predictors 
                                  in order to fit a simple regression model. 
                                  He/she can also choose the order of polynomial
                                  of the model."),
                                
                                br(),
                                
                                h4("Example"),
                                
                                br(),
                                
                                p("If the user chooses:"),
                                
                                p("a) Displacement, as a predictor and"),
                                
                                p("b) 2, as the degree of the model"),
                                
                                p("then the model that will be fitted is the following:"),
                                
                                h2("$$mpg = b_0 + b_1*disp + b_2*disp^2$$")
                                

                        )


                )
        )
)
)