lapply(c('XML', 'logging', 'reshape', 'reshape2', 'MLmetrics', 'data.table'), require, character.only = TRUE)

path <- 'C:/Users/34671/Documents/GitHub/R_Gapminder_Predictor/'

lapply(paste0("R/", list.files(path = "R/", recursive = TRUE)), source)

debug(GapminderApp)
GapminderApp(path)
undebug(GapminderApp)
