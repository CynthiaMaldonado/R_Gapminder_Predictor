#' @title Generating Output
#' @description generate output file with the user's request
#'
#' @param output 
#' @param config 
#' @param path 
#'
#' @import logging
#' 
#' @return
#' 
#' @author MigBor

generarOutput <- function(output, config, path){

marktmp <- Sys.time()
# this will give us information to check the efficiency of our app
pathOutput <- paste0(path, "output/output.txt")

tryCatch(expr = {
  write.table(output, file = pathOutput, row.names = FALSE, col.names = FALSE)
  
}, error = function(e){
  
  logerror("Something went wrong saving!", logger = 'log')
  stop()
})
}