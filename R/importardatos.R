


#' @Title importdata
#'
#' @param path 
#' @param config 
#'
#' @return df_merge_final
#' @export

#' @import reshape2
#' @author gonzalo


 importdata <- function(path,config){
   
   dataPath <- paste0(path, "data/")
  
  tryCatch(expr = {
    
  # creating an empty list and a list with all csv,s located in config
  preds <- strsplit(config$data$predictors, ',')[[1]]
  list_df <- list()
  filenames <- as.list(c(preds, config$data$target))
  
  # loop to open csv and append to list
  for (i in 1:length(filenames)){
    #url <- paste0(dataPath, filenames[i])
    df <- data.table::fread(paste0(dataPath, filenames[i]), sep = ',', encoding = 'UTF-8', 
                            data.table = FALSE, header = TRUE)
   
    
    list_df[[i]] <- melt(df)
  }  
  }, error = function(e){
    
    logerror("Data not found in that path. Check directory and config.",
             logger = 'log')
    stop()
  })
  
  # merging df
  
  df_merge_final <- merge_all(list_df, by=c("country","variable"))
  colnames(df_merge_final)[ncol(df_merge_final)] <- "target"
  return(df_merge_final)
}
