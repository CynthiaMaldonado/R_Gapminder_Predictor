#' @title prediction
#'
#' @description search for the required output
#'
#' @param df_merge_final, dataframe
#' @param config
#'
#' @export
#' @import
#'
#' @return output_value
#' @author Fran&Cyn
#' 


prediction <- function(df_merge_final, config){
  # get year and country selected by the user.
  
  country_user <- config$data$country
  year_user <- config$data$year
  
  target_value <- with(df_merge_final, target[country==country_user,
                                              year==year_user])
  
  pred_file <- (df_merge_final$country %in% country_user) & 
              (df_merge_final$year %in% year_user)
  
  check_nan <- df_merge_final[pred_file, 3:(ncol(df_merge_final)-1)]
  
  if(is.na(target_value) == FALSE){
    
    return(target_value)
    }
  
  else{
    
    if(is.na(check_nan) == FALSE){
      
      output_pred <- regression_model(df_merge_final, config)
      }
    
    else{
      
      output_impossible <- print('Sorry, we have not enough information to 
                                 make a prediction.')
      }
    }
}
  