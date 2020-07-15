#' @title callConfig
#' @description xml config to R_list
#'
#' @param path
#' 
#' @export 
#' @import XML
#' 
#' @return config
#'
#' @author Cyn

callConfig <- function(path){

  configPath <- paste0(path, "config/config.xml")
  
  tryCatch(expr = {
    
    # read xml y turn it into a list
    config <- XML::xmlToList(xmlParse(configPath))
    
    
  }, error = function(e){
    
    logerror("Config not found. Check if the filename in configpath is config.xml",
             logger = 'log')
    stop()
  })
  
  loginfo("Config read.", logger = 'log')
  
  validateConfigNodes(config)
  
  config$data$predictors <- trimws(strsplit(config$data$predictors, ",")[[1]])
  
  sep <- config$data$sep %in% c(",")
  
  if(!sep){
    
    logerror("Sep has to be ','", logger = 'log')
    stop()
    
  }
  
  return(config)
  
} 

#' @title validateConfigNodes
#'
#' @param config 
#'
#' @import logging
#' 
validateConfigNodes <- function(config){
  
  principalNode <- identical(names(config), c("data", "model"))
  dataNode <- identical(names(config$data), c("predictors", "sep", "target", "country", "year"))
  modelNode <- identical(names(config$model), c("trainRate"))
  
  nodes <- c("principalNode" = principalNode, "dataNode" = dataNode, 
             "modelNode" = modelNode)
  
  check <- all(nodes)
  
  if(!check){
    
    badNodes <- names(nodes)[!nodes]
    
    logerror(paste0("Nodes: ", paste(badNodes, collapse = ", "),
                    " are wrongly structured!"), logger = 'log')
    stop()
    
  }
  
}