library(shiny)
library(ggplot2)
data(mtcars)
feat_names <- c("Miles per Gallon","", "Displacement", "Gross Horsepower", "","Weight")


 
shinyServer(
        function(input, output) {
                output$oid1 <- renderPlot({
                        feat_num <- as.numeric(input$id1)
                        deg_pol <- as.numeric(input$id2)
                        feat_name <- feat_names[feat_num]
                        feat_range <- range(mtcars[,feat_num])
                        x_values <- seq(feat_range[1],feat_range[2], length = 300)
                        form <- formula(paste0(names(mtcars)[1],"~","poly(",names(mtcars)[feat_num],",",deg_pol,")"))
                        fit <- lm(form, data = mtcars)
                        new_d <- data.frame(x_values)
                        names(new_d) <- names(mtcars)[feat_num]
                        
                        pred <- stats::predict(fit, newdata = new_d)
                        
                        
                        plot(mtcars[,1]~mtcars[,feat_num],
                             xlab = feat_names[feat_num], 
                             ylab = feat_names[1],
                             pch = 1,
                             cex.lab = 1.3,
                             col = "darkred")
                        
                        lines(x_values, pred, col = "darkblue", lwd = 2)

                      
                        
                        
                        })
                
        }
)