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
       datos1<- readRDS("C:/OMAR-2015/GitHubProjects/shinyTree/trial_module_list.rda")
       datos1
    
  })
  
  output$vars <- renderPrint({
    if(is.null(input$tree)) {print("omar")}
   # get_selected(tree)
    trait_selected <<- unlist(get_selected(input$tree))
    trait_selected <- stringr::str_replace_all(string = trait_selected,pattern = ":.*" ,replacement = "")
    #invalid_elements <- fbmodule::list_modules(crop=input$designFieldbook_crop) 
   # invalid_elemetns <- c("yield")
    #out <- str_detect(string = trait_selected,pattern = c())
    trial_headers <- c("yield","late blight","drought","bulking","dormancy","participatory variety selection")
    trait_selected <- trait_selected[!is.element(el = trait_selected, set = trial_headers)]
    
    
    
    #trial_headers_detected <- str_detect(string = trait_selected,pattern = trial_headers)
    #trial_headers_detected <- is.element(el = trial_headers = trait_selected)
    
    #trait_selected <- trait_selected[!trial_headers_detected]
    #trait_selected <- trait_selected[!is.na(trait_selected)]
    
    print(trait_selected)
    
    
  })
  
})