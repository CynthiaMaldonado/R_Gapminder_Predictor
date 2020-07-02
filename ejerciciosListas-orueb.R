#ej 1
#Write a R program to create a list containing strings,
#numbers, vectors and a logical values

mi_lista <- list("hola", 42, c(1, 2, 3), TRUE)


 # HOLA

#ej 8
#Write a R program to merge two given lists into one list

a <- list(1, 2)
b <- list(3, 4)

merg_list <- list(a, b)
merg_c <- c(a, b)
merg_app <- append(a, b)

all.equal(merg_c, merg_app)
all.equal(merg_c, merg_list)

do.call(c, list(a, b)) <--> c(a, b)
do.call(mean, mi_lista[1:10])

#ej10
#Write a R program to create a list of dataframes and access each of
#those dataframes from the list

d1 <- mtcars
d2 <- mtcars

list_of_df <- list(mtcars, mtcars)

list_of_df[[1]]
list_of_df[[2]]

#ej11
#Write a R program to count number of objects in a given list

length(list_of_df)

#ej12
#Write a R program to convert a given dataframe to a list by rows

spliteado2 <- split(mtcars, 1:nrow(mtcars))

#ej14
#Write a R program to assign NULL to a given list element
mi_lista <- list(a = 1, b = 2, c = 3)

mi_lista[2] <- list(NULL)
mi_lista['b'] <- list(NULL)
mi_lista[[2]] <- NULL
mi_lista$b <- list(NULL)
