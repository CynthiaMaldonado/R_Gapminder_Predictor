


#' @Title importdata
#'
#' @param path 
#' @param config 
#'
#' @return df_merge_final
#' @export

#' @import reshape
#' @author gonzalo
#' 
 importdata <- function(path,config){
  # creating an empty list and a list with all csv,s located in config
  list_df <- list()
  filenames <- c(config$data$predictors, config$data$target)
  # loop to open csv and append to list
  for (i in 1:length(filenames)){
    url <- paste(path, filenames[i],sep = "/")
    df <- data.table::fread(url,data.table = FALSE, header = TRUE)
   
    
    list_df[[i]] <- melt(df)
  }  
  # merging df
  df_merge1 <- merge(list_df[[1]],list_df[[2]], by=c("country","variable"))
  df_merge_final <- merge(df_merge1, list_df[[3]], by=c("country","variable")) 
  colnames(df_merge_final)[5] <- "target"
  return(df_merge_final)
}
