
library(googleVis)
library(shiny)
## The data: presidential election data by state from 1932 - 2012
data <- data.frame(read.csv("US_election.csv"))
data_graph<- data[,-c(3)]
time<- seq(1932,2012,4)
shinyServer(function(input, output) {
        myYear <- reactive({
                input$Year
        })
        output$Year <- renderText({
                paste("Democratic share (%) of the presidential vote in", myYear())
        })
        output$gvis <- renderGvis({
                myData <- subset(data_graph, 
                                 (Year > (myYear()-1)) & (Year < (myYear()+1)))
                gvisGeoChart(myData,
                             locationvar="State", colorvar="DemVote",
                             options=list(region="US", displayMode="regions", 
                                          resolution="provinces",
                                          width=500, height=400,
                                          colorAxis="{colors:['#FF0040', '#0000FF']}"
                             ))     
        })
        myOptions<- reactive({
               data<-data[data$Year==input$selection,]
                             })                      
        output$State_Table <- renderTable({myOptions()})     
})







        
        
