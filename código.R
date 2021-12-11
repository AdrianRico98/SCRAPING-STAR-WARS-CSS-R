
#Cargamos las librerías necesarias.

library(rvest)
library(stringr)
library(tidyverse)
library(openxlsx)

#Probamos el código de scraping con los nodos extraidos por el selector gadget (css) en la temporada 7 (primera en cargar en IMDB)

page <- read_html("https://www.imdb.com/title/tt0458290/episodes?ref_=tt_eps_sm") %>% #leemos la web entera.

titulos <- page %>% #creamos el vector con los titulos de los episodios.
  html_nodes(".info a") %>% #nodo extraído con el selector gadget.
  html_text() %>% 
  str_subset("^[A-Z]") # se obtiene un vector caracter donde los títulos de los episodios son los únicos elementos que empiezan con mayusculas, por eso extraemos con str_subset únicamente esos elementos.

ratings <- page %>% #creamos el vector con los ratings de los episodios.
  html_nodes(".ipl-rating-star.small .ipl-rating-star__rating") %>% #nodo extraído con el selector gadget.
  html_text() %>% 
  parse_number() #se importan de la web en formato caracter así que se requiere de parse_number para que esten formateados correctamente.

temporada <- replicate(length(titulos), 7) #creamos el vector que distinga en la tabla final la temporada de cada episodio.

data_7 <- data.frame(titulos,ratings, temporada)
head(data_7)


# Comprobado el funcionamiento del código, creamos una función denominada scraping, aplicable al resto de temporadas (6).
#Siendo n el número de temporadas y con las urls de cada temporada cargadas: 

urls <- c("https://www.imdb.com/title/tt0458290/episodes?season=1","https://www.imdb.com/title/tt0458290/episodes?season=2","https://www.imdb.com/title/tt0458290/episodes?season=3","https://www.imdb.com/title/tt0458290/episodes?season=4","https://www.imdb.com/title/tt0458290/episodes?season=5","https://www.imdb.com/title/tt0458290/episodes?season=6")

scraping <- function(n){
  page <- read_html(urls[n])
  
  titulos <- page %>% 
    html_nodes(".info a") %>% 
    html_text() %>% 
    str_subset("^[A-Z]")
  
  ratings <- page %>% 
    html_nodes(".ipl-rating-star.small .ipl-rating-star__rating") %>% 
    html_text() %>% 
    parse_number()
  
  temporada <- replicate(length(titulos), n)
  
  data.frame(titulos,ratings, temporada)
  
}

#Aplicamos la función a todas las temporadas y unimos los conjuntos de cada temporada en la tabla final ("data").

data_1 <- scraping(1)
data_2 <- scraping(2)
data_3 <- scraping(3)
data_4 <- scraping(4)
data_5 <- scraping(5)
data_6 <- scraping(6)

data <- union(data_1,data_2) %>% 
  union(data_3) %>% 
  union(data_4) %>% 
  union(data_5) %>%
  union(data_6) %>%
  union(data_7)

write.xlsx(data,"clone_wars.xlsx", asTable = TRUE) #si queremos los datos en excel, se puede ejecutar este código.


