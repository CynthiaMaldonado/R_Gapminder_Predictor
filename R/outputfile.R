#' Title Generating Output
#'
#' @param output 
#' @param config 
#' @param path 
#'
#' @import logging
#' @return
#' @author MigBor

generarOutput <- function(output, config, path){

marktmp <- Sys.time()
# this will give us information to check the efficiency of our app
namefile <- paste0(path, "data/")

tryCatch(expr = {
  
  write.csv(output, file = namefile, sep = config$input$sep)
  
}, error = function(e){
  
  logerror("Something went wrong saving!", logger = 'log')
  stop()
})


namefile <- paste0(path, "output/model.R")

tryCatch(expr = {
  
  saveRDS(output$model, file = namefile)
  
}, error = function(e){
  
  logerror("The model is not saved!", logger = 'log')
  stop()
})
}