
#' @title regression model
#' 
#' @description Code to run the linear regression model.
#' 
#' @param df_merge_final, dataframe
#' @param config
#' 
#' @export 
#' @import MLmetrics
#' 
#' @return final_prediction

#' @author Fran&Cyn

regression_model <- function(df_merge_final, config){
  
  #Drop rows with NAs
  
  #clean_df <- na.omit(df_merge_final)
  #clean_df <- df_merge_final[complete.cases(df_merge_final), ]
  
  # Extract country and year to train the model
  
  clean_df <- clean_df[, 3:(ncol(clean_df))]
  
  #linear regression model. ATTENTION: y ~ x 
  
  object_model <- lm(target ~ . , data=clean_df)
  
  #predict WITH X
  
  output_value <- predict(object_model, df_merge_final[
                (df_merge_final$country %in% country_user) & 
                (df_merge_final$year %in% year_user), ]) 
  
  #make a comparison of predictions with test
  
  predictions_comparison <- RMSE(predictions, df_merge_final$target)
  
  #return (predictions_comparison)
  return (output_value)
  
}















