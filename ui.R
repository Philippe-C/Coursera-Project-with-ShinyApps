library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("The Geography of US Presidential Elections from 1932 to 2012: Blue States vs Red States?"),
                
                sidebarPanel(
                sliderInput("Year", "Select the presidential election year:", 
                            min=1932, max=2012, value=1932,  step=4,
                            format="###0",animate=TRUE),
                selectInput(inputId="selection", label="Results per States (%):",choices=c("1932","1936","1940","1944","1948","1952","1956","1960","1964","1968","1972","1976","1980","1984","1988","1992","1996","2000","2004","2008","2012"), selected = NULL, multiple = FALSE, selectize = FALSE),
                h6('Author: Philippe-C (Coursera Data Science - June 2015)'),
                p(' During US elections campaigns media pundits speak gravely of the deep ideological divisions reflected in a political map of red and blue states, but according to Gelman et al. (Ref.1 below) , much of the analysts are misguided. Indeed, data show a completely different story and he found that in rich states (such as Connecticut) income has a very low correlation with vote preference. Therefore, the red-blue paradigm seems to be over simplistic and innapropriate for the current political landscape in the United States.'),
                p(' It was probably true that, from the Civil War to the 1930s (Watch the lectures of Professor Lewis from Stanford, ref.2 below), the South States (poor states) and the North-East States (rich states) voted respectively for the Democrat Party and the Republican Party.'),
                p('Our ShinyApp shows clearly an inversion of pattern and President Obama was elected mainly by the votes of electors from the North-East and the West Coast. Looking at the last 70 years, probably only the Heartland (an extension of the Midwest including states such as Idaho and Wyoming) has remained in constant support of the republican candidates. In the same time, the South States now seem to be part of a red belt.'),
                p('Playing with the App you can build your own conclusion, nonetheless the data suggest that other factors, such as religiosity and cultural values, should be explored for clues to explain voting behavior.'),
                
                p("Just a Reminder:"),
                p("Roosevelt (Dem.) (1933-1945), Truman (Dem.) (1945-1953), Eisenhower (Rep.) (1953-1961), Kennedy (Dem.) (1961-1963), Johnson (Dem.) (1963-1969), Nixon(Rep.) (1969-1974), Ford (Rep.) (1974-1977), Carter (Dem.) (1977-1981), Reagan (Rep.) (1981-1989), Bush (Rep.) (1989-1993), Clinton (Dem.) (1993-2001), Bush Jr (Rep.) (2001-2009), Obama (Dem.) (2009-)"),
                p("Data:"),
                p('Our dataset covering the period 1932-2012 is based on the results published by the Federal Election Commitee (Ref.3 below), the associated CSV file contains a 1047x5 matrix and the last column indicates whether or not the mentioned State is a South State. We decided to show the graph of Democrats Votes, but this choice is purely arbitrary and naturally Republicans Votes, if displayed (which is easyYruru), would be complementary. All data were processed on Rstudio Version 0.98.1091 and MAC OS Mavericks 10.9.5.'),
                
                h6("Reference (1):", a("Gelman, et al. (2007),", tags$i("Rich State, Poor State, Red State, Blue State: What’s the Matter with Connecticut?,"), "Quarterly Journal of Political Science, 2007, 2: 345–367", href="http://www.stat.columbia.edu/~gelman/research/published/rb_qjps.pdf"))                ,
                h6("Reference (2):", a("Prof. M. Lewis (Stanford),", tags$i("Geography of US Election,"), "openAcademy", href="http://theopenacademy.com/content/geography-united-states-elections")),
                h6("Reference (3):", a("Prof. J.T. Wooley and G. Peters (University of California),", tags$i("Data Section,"), "The American Presidency Project", href="http://www.presidency.ucsb.edu/showelection.php?year=2012"))
                ),
        
                mainPanel(
                h3(textOutput("Year")),
                h6("(You can use your mouse pointer to explore the chart)"),
                htmlOutput("gvis"),
                h5("Results per States (%)"),
                htmlOutput("State_Table")
                )
)
)



