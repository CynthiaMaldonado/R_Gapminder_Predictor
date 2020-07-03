
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



#' @title lineal regression model
#' 
#' @description code to run the linear regression model.
#' 
#' @param 
#' 
#' @return 

#' @author Fran

#get the dataset

cars=datasets::mtcars 

regression_model <- function(predictors, target){

#Split in Train & Test

smp_size <- floor(0.75 * nrow(mtcars))

train_ind <- sample(seq_len(nrow(mtcars)), size = smp_size)

train <- mtcars[train_ind, ]
test <- mtcars[-train_ind, ]

#linear regression model. ATTENTION: y ~ x 

model <- lm(train$mpg ~ train$hp)

#predict WITH X

predictions <- predict(model, data.frame(train$hp)) 

#make a comparison of predictions with test

predictions_comparison <- RMSE(predictions, test$hp)

}















