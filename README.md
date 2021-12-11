SCRAPING STAR WARS:CLONE WARS
================
Proyecto creado por Adrián Rico Alonso - 11/12/2021

# OBJETIVO DEL PROYECTO

En este proyecto trato de demostrar mi capacidad para realizar web
scraping. En un proyecto anterior, que puede ser encontrado en el
portfolio, denominado “Scraping y wrangling: Shang Chi y la leyenda de
los diez anillos” utilizo el web scraping para extraer tablas html
“incrustadas” en la web de box office mojo. Sin embargo, en este
proyecto se realiza un web scraping de **elementos que no se encuentran
en formato tabla** dentro de la web. Por extrapolación, se muestra como
puede hacerse scraping de cualquier elemento que no se encuentre en
tablas.

En concreto, el scraping se hace sobre la [web
IMDB](https://www.imdb.com/title/tt0458290/episodes?ref_=tt_eps_sm)
dedicada a la serie de animación Star Wars: Clone Wars. El objetivo es
generar un conjunto de datos que incluya tres variables: el título del
episodio, su valoración y la temporada a la que pertenece. Este conjunto
de datos puede utilizarse para diversos fines, en mi caso se hizo para
crear un [dashboard
interactivo](https://public.tableau.com/app/profile/adri.n.rico.alonso/viz/ElpblicoopinaStarWarsCloneWars/ElpblicoopinaStarwarsCloneWars)
en Tableau.

# METODOLOGÍA

Para poder extraer cualquier parte de la web, el “nodo” se debe extraer
con la ayuda de alguna herramienta que permita identificar los
selectores CSS de la página. En mi caso, se ha usado la herramienta
gratuita como extensión de Google Chrome [Selector
gadget](https://chrome.google.com/webstore/detail/selectorgadget/mhjhnkcfbdhnjickkkdbjoemdmbfginb?hl=es).
Con selector gadget únicamente basta con seleccionar dentro de la web la
parte que quieres extraer y la herramienta te proporciona el código o
selector que esta asociado con esa parte.

A partir de aquí, la metodología es la misma que la que se aplica con el
scraping de una tabla de datos, es decir, observar los problemas que ha
tenido la importación, limpiar y organizar.
