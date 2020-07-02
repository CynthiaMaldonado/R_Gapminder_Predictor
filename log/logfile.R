
#' @title loginfo
#' @description inform the user about the processing status
#' 
#' @param path, string 
#' 
#' @export
#' @import logging
#'
#' @author MigBor



GapminderApp <- function(path){
  
  tryCatch(expr = {
    
    library(logging)
    
    #Create "log" controller
    addHandler(writeToFile, logger = "log", file = paste0(path, "/log/logfile.log"))
    loginfo("Starting the app...", logger = "log")
    
    loginfo("Reading Config...", logger = "log")
    config <- leerConfig(path)
    loginfo("Config read.", logger = "log")
    
    
    loginfo("Reading data...", logger = "log")
    datos <- leerDatos(config, path)
    loginfo("Data read.", logger = "log")
    
    
    loginfo("Processing data...", logger = "log")
    splitDatos <- preProcesarDatos(datos, config)
    loginfo("Data processed.", logger = "log")
    
    # Just in case the app compare some models. For the moment we just apply r.lin
    loginfo("Generating model...", logger = "log")
    output <- generarModelo(splitDatos, config)
    loginfo("Modelo generated.", logger = "log")
    
    
    loginfo("Generating output...", logger = "log")
    generarOutput(output, config, path)
    loginfo("Output ready to check.", logger = "log")
    
  }, error = function(e){
    
    logerror("App bloqued...", logger = "log")
    stop()
    # In case of blocking errors, the app will stop.
  },finally = {
    
    loginfo("End of execution.", logger = "log")
    removeHandler(writeToFile, logger = "log")
    # Disable the controller 
  })
  
  
}
