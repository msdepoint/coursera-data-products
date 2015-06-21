library(shiny)
data(women)

calcBMI <- function( height , weight ) (weight*0.4535)/(height*0.0254)^2
calcBMIString <- function( height , weight ){
  bmiValue <- calcBMI( height , weight )
  if( bmiValue <= 18.5 ){
    "Under Weight"
  }
  else if( bmiValue < 25 ){
    "Normal Weight"
  }
  else if( bmiValue < 30 ){
    "Over Weight"
  }
  else{
    "Obesity"
  }
}

predictWeight <- function( yourHeight ){
  fit <- lm( weight~height , data = women )
  yourData <- data.frame( height = as.numeric(yourHeight) )
  predict( fit , newdata = yourData )
}

predictHeight <- function( yourWeight ){
  fit <- lm( height~weight , data = women )
  yourData <- data.frame( weight = as.numeric(yourWeight) )
  predict( fit , newdata = yourData )
}

shinyServer( 
  
  function(input, output) {
    
    pHeight <- reactive( {predictHeight(as.numeric(input$weight))} )
    pWeight <- reactive( {predictWeight(as.numeric(input$height))} )
    bmiValue <- reactive( {calcBMI(as.numeric(input$height) , as.numeric(input$weight))} )
    bmiResString <- reactive( {calcBMIString( as.numeric(input$height) , as.numeric(input$weight) )} )
    
    output$weight <- renderPrint({as.numeric(input$weight)}) 
    output$predictHeight <- renderPrint({
      input$Submit
      pHeight()[[1]]
    })
    
    output$height <- renderPrint({as.numeric(input$height)})
    output$predictWeight <- renderPrint({
      input$Submit
      pWeight()[[1]]
    })
    
    output$bmi <- renderPrint({
      input$Submit
      bmiValue()[[1]]
    })
    
    output$bmiResString <- renderPrint({
      input$Submit
      bmiResString()[[1]]
    })
  }
)

