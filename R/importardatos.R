#' @Title importdata
#' @description import and merge data from config
#'
#' @param path 
#' @param config 
#' 
#' @export
#' @import reshape2
#' @import data.table
#' @import tidyverse
#' 
#' @return df_merge_final
#' 
#' @author gonzalo


 importdata <- function(path,config){
   
   dataPath <- paste0(path, "data/")
  
  tryCatch(expr = {
    
  # creating an empty list and a list with all csv,s located in config
  preds <- config$data$predictors
  list_df <- list()
  filenames <- c(preds, config$data$target)
  
  # loop to open csv and append to list
  for (i in 1:length(filenames)){

    df <- data.table::fread(paste0(dataPath, filenames[i]), sep = ',', encoding = 'UTF-8', 
                            data.table = FALSE, header = TRUE)
   
    
    list_df[[i]] <- reshape2::melt(df)
  }  
  }, error = function(e){
    
    logerror("Data not found in that path. Check directory and config.",
             logger = 'log')
    stop()
  })
  
  # merging df
   
   library(tidyverse)
   df_merge_final <- reduce(list_df, full_join, by = c("country","variable"))
   
  #df_merge_final <- merge_all(list_df, by=c("country","variable"))
  colnames(df_merge_final)[ncol(df_merge_final)] <- "target"
  return(df_merge_final)
}
