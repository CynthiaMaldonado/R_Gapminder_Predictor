lapply(c('XML', 'logging', 'reshape', 'MLmetrics'), require, character.only = TRUE)

path <- 'C:/Users/34671/Documents/GitHub/R_Gapminder_Predictor/'

lapply(paste0("R/", list.files(path = "R/", recursive = TRUE)), source)

R_Gapminder_Predictor <- paste0(path, "R/start.R")
