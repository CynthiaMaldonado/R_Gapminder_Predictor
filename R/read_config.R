#' @title callconfig
#' @description xml config to R_list
#'
#' @param path, string 
#'
#' @return list(config.xml)
#' 
#' @export 
#' @import XML
#'
#' @author Cyn

callconfig <- function(path){

config_path <- paste0(path, "config/config.xml")
xmldoc <- XML::xmlParse(path)
config <- XML::xmlToList(xmldoc)

return (config)

}