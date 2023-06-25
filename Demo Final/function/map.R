
##---MAP

map_plot <- function(data){
  
  
  
  
  provinsi <- data[,1]
  ## Make Plot
  #plot <- leaflet() %>%
  
  icons <- awesomeIcons(
    #icon = 'ios-close',
    #iconColor = 'black',
    library = 'ion',
    markerColor = "blue"
  )
  
  
  leaflet(data = data) %>%
    # addProviderTiles(providers$Stamen.Watercolor) %>%
    
    # Centre the map in the middle of Toronto
    addProviderTiles("OpenStreetMap") %>%
       setView( lng = 118
                 , lat = -2.5
                 , zoom = 4 ) %>%
    setMaxBounds( lng1 = 89.5
                  , lat1 = -14.5
                  , lng2 = 149.5
                  , lat2 = 9.5 ) %>%
    addCircleMarkers(~Longitude, 
                     ~Latitude,
                     fillOpacity = 1,
                     radius = 5,
                     popup = ~prov) %>%
    addAwesomeMarkers( ~Longitude, 
                       ~Latitude,  
                       label =  NULL,
                       icon = icons ) %>%
    addControl(html = "Klik Satu Titik!",
               position = "topright")
    ## ENDLINE
}