---
title       : Data Product Project on Coursera
subtitle    : Data Science Specialisation from Johns Hopkins University
author      : Philippe-C
job         : Analyst
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
logo        : CourseTrackLogo.png
assets      : {assets: ../../assets}
---


##  A political Science Project:

In this Cousera Course we were ask to find a simple idea that we can illustrate with a ShinyApp built on Rstudio with Slidify.
During US elections campaigns media pundits speak gravely of the deep ideological divisions reflected in a political map of red and blue states, but according to Gelman et al. (2007), much of the analysts are misguided. Indeed, data show a completely different story and he found that in rich states (such as Connecticut) income has a very low correlation with vote preference. Therefore, the red-blue paradigm seems to be over simplistic and innapropriate for the current political landscape in the United States.
Playing with the App you can build your own conclusion, nonetheless the data suggest that other factors, such as religiosity and cultural values, should be explored for clues to explain voting behavior.

The information given in the App and Github repo (including the R codes: ui.R, server.R; and the data file: US_elections.csv) allow you to reproduce these results and maybe extend them, why not!

http://github.com/Philippe-C/Coursera-Developing-Data-Products-Project

--- &radio
## A political Science Question: 

Where did Obama build his victory in 2012?

1. In the South

2. In the Heartland

3. _North-East and West Coast_

4. Difficult to Assess

*** .hint 
The Heartland can be considered as an extension of the Midwest including states such as Idaho and Wyoming. These voters are reputed to be more conservative.

*** .explanation 
Our ShinyApp helps to visualize that President Obama was elected mainly due the voters of the western coast an north-eastern states. Have a look!

Our ShinyApp really helps to answer such a political science question and supports the idea that the classical Red States vs Blue States (Rich vs Poor) paradigm is outdated in terms of prediction of voting behaviour.

--- .class #id 
## The Server R Code:


```r
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
        })
```

In order to respect the 5 pages limitation, the rest of the Server.R code and the ui.R file can not presented here, please refer to the Github repo!

--- .class #id
## The Shiny App:
The link showing the App is given below:

https://philippe-c.shinyapps.io/Coursera-Developing-Data-Products-Project















