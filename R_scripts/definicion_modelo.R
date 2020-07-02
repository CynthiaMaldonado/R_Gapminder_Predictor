@title callconfig
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

cars=datasets::mtcars


attach(cars) #Access to variables.

pairs(cars[,3:6])

model <- lm(mpg ~ disp) #lineal regression model.

predict(model,data.frame(mpg)) #predict

print=(Mean squared error: %2f'')  



