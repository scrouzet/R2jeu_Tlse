library(rgdal)
#library(sp)
library(leaflet)

r2jeu <- rgdal::readOGR("aires-de-jeux.geojson", "OGRGeoJSON")


m <- leaflet(r2jeu) %>%
  addTiles() %>%
  addCircleMarkers(radius = ~nb_jeux)
m


# m <- leaflet() %>%
#   addTiles() %>%
#   addMarkers(lng=r2jeu@coords[,1], lat=r2jeu@coords[,2], popup="The park")
# m

# addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
  #             fillColor = ~pal(r2jeu@data$nb_jeux),
  #             label = ~paste0(county, ": ", formatC(pop, big.mark = ","))) %>%

# Export de la carte en html
library(htmlwidgets)
saveWidget(m, 'mapR2jeux.html', selfcontained = TRUE)