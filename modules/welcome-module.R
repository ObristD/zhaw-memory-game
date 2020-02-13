

# Welcome module ----------------------------------------------------------


welcome_UI <- function(id) {
  ns <- NS(id)
  modalDialog(
    title = tags$h1(
      style = "text-align: center;",
      "Welcome to ZHAW engineering memory game !"
    ),
    tags$div(
      style = "text-align: center;",
      tags$p("Find all matching lecturers as soon as possible!"),
      tags$p("Click on an lecturer to return it"),
      tags$p("You can see only two lecturers at the same time"),
      tags$p("When you're ready, click button below to play !")
    ), 
    footer = actionButton(
      inputId = ns("play"),
      label = "Play !",
      icon = icon("play"),
      style = "width: 100%"
    )
  )
}

welcome <- function(input, output, session) {
  
  id <- gsub("-$", "", session$ns(""))
  showModal(ui = welcome_UI(id))
  
  observeEvent(input$play, {
    removeModal()
  })
  
  return(reactive(input$play))
}

