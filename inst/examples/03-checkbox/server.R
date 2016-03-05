library(shiny)
library(shinyTree)

#' Define server logic required to generate a simple tree
#' @author Jeff Allen \email{jeff@@trestletech.com}
shinyServer(function(input, output, session) {
  log <- c(paste0(Sys.time(), ": Interact with the tree to see the logs here..."))
  
  output$tree <- renderTree({
#      out <- list(
#       root1 = "123",
#       root2 = "12432"
#        root2 = list(
#         SubListA = list(leaf1 = "omar", leaf2 = "", leaf3="")
#         SubListB = list(leafA = "", leafB = "")
#       )
#      )
#      
       datos1<- readRDS("D:/GITHUB/shinyTree/trial_module_list.rda")
       datos1
    
  })
  
  output$vars <- renderPrint({
    if(is.null(input$tree)) {print("omar")}
   # get_selected(tree)
    print(unlist(get_selected(input$tree)))
  })
  
  
})