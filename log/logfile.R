
#' @title Gapminder_Predictor
#' @description Predictor de datos por fecha y país
#' 
#' @param path, string 
#' 
#' @export
#' @import logging
#'
#' @author MigBor
GapminderApp <- function(path){
  
  tryCatch(expr = {
    
    library(logging)
    
    #Creando el controlador "log", he copiado el nombre porque es cortito
    addHandler(writeToFile, logger = "log", file = paste0(path, "/log/logfile.log"))
    loginfo("Iniciando la App...", logger = "log")
    
    loginfo("Leyendo Config...", logger = "log")
    config <- leerConfig(path)
    loginfo("Config leído.", logger = "log")
    
    
    loginfo("Leyendo los datos...", logger = "log")
    datos <- leerDatos(config, path)
    loginfo("Datos leídos.", logger = "log")
    
    
    loginfo("Procesando los datos...", logger = "log")
    splitDatos <- preProcesarDatos(datos, config)
    loginfo("Datos procesados.", logger = "log")
    
    # Es posible que modifiquemos esta parte si al final solo aplicamos r.lin
    loginfo("Generando modelo...", logger = "log")
    output <- generarModelo(splitDatos, config)
    loginfo("Modelo Generado.", logger = "log")
    
    
    loginfo("Generando output...", logger = "log")
    generarOutput(output, config, path)
    loginfo("Output generado.", logger = "log")
    
  }, error = function(e){
    
    logerror("Aplicación bloqueada...", logger = "log")
    stop()
    # Para errores bloqueantes, hacemos que la aplicación colapse.
  },finally = {
    
    loginfo("Fin de la ejecución.", logger = "log")
    removeHandler(writeToFile, logger = "log")
    # Desactivamos el controlador 
  })
  
  
}
