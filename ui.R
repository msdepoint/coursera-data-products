library(shiny)

shinyUI( 
  pageWithSidebar(
    
    #Application Title
    headerPanel("Height and Weight Prediction and BMI calculator"),
    
    sidebarPanel(
      p("This app try to predict your normal weight and height according your given height an weight."),
      p("Furthe more, you will get your BMI(Body Mass Index) and see your BMI categoy."),
      p("to get started, input your weight and height seperately and click Submit."),
      p("Enjoy:)"),
      sliderInput( 'weight' , 'Your Weight: (pounds)' , 115 , min=80 , max=500 , step=0.5 ),
      sliderInput( 'height' , 'Your height: (inches)' , 60 , min=50 , max=80 , step=0.5 ),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Your Results'),
      
      h4('Your weight is: (pounds)'),
      verbatimTextOutput("weight"),
      h4('Your height is: (inches)'),
      verbatimTextOutput("height"),
      
      h3('Prediction'),
      p('According our data, the average weight for your height is: (pounds)'),
      verbatimTextOutput("predictWeight"),
      p('According to our data, the average height for your weight is: (inches)'),
      verbatimTextOutput("predictHeight"),
      
      h3('You BMI (Body Mass Index) is:'),
      verbatimTextOutput("bmi"),
      p('according your BMI value, your BMI Category is:'),
      verbatimTextOutput("bmiResString"),
      
      p('Note,The data set used in this app appears to have been taken from the American Society of Actuaries Build and Blood Pressure Study for some (unknown to us) earlier year.'),
      p('This data set gives the average heights and weights for American women aged from 30 to 39. So it may be not accuracy for men or women beyong that age range.'),
      p('Source, The World Almanac and Book of Facts, 1975.'),
      p('References, McNeil, D. R. (1977) Interactive Data Analysis. Wiley.')
    )
  )
)