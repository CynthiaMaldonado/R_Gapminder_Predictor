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

xmldoc <- XML::xmlParse(path)
config <- XML::xmlToList(xmldoc)

return (config)

}