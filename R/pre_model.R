
#' @title Lineal regression model
#' 
#' @description Code to run the linear regression model.
#' 
#' @param df_merge_final, dataframe
#' 
#' @export 
#' @import MLmetrics
#' 
#' @return final_prediction

#' @author Fran


#get the dataset

cars=datasets::mtcars 

regression_model <- function(df_merge_final){
  
  #Drop rows with NAs
  
  clean_df <- na.omit(df_merge_final)
  
  #Split X and y
  
  y <- clean_df[,ncol(clean_df)]
  X <- clean_df[, 3:(ncol(clean_df) -1)]

  #Split in Train & Test
  
  smp_size <- floor(config$model$trainRate * nrow(clean_df))
  
  set.seed(123)
  
  train_ind <- sample(seq_len(nrow(clean_df)), size = smp_size)
  
  X_train <- X[train_ind, ]
  X_test <- X[-train_ind, ]
  
  y_train <- y[train_ind, ]
  y_test <- y[-train_ind, ]
  
  #linear regression model. ATTENTION: y ~ x 
  
  object_model <- lm(y_train ~ X_train)
  
  #predict WITH X
  
  predictions <- predict(object_model, X_test) 
  
  #make a comparison of predictions with test
  
  predictions_comparison <- RMSE(predictions, y_test)
  
  return (predictions_comparison)
  
}















