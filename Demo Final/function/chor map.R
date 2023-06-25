
##---MAP

chor_map <- function(data, Kom = "Seluruh Komoditas"){
  
  
  
  if (Kom != "Seluruh Komoditas"){
    data1 <- data %>%
      filter(cat %in% Kom) %>%
      mutate(t.output = output)
  } else {
  
  data1 <- data %>%
    group_by(prov) %>%
    summarize(t.output = sum(output))
  }
  
  
  outputPalette <- colorNumeric(
    palette = "YlOrRd",
    domain = data1$t.output
  )
  
#  map_lab <- paste("Provinsi: ", , "<br/>",
#                   "Total Output: ", "data1$t.output", "<br/>",) %>%
#    lapply(HTML)
  
  
  map_lab <- paste(
    "Provinsi: ", map$PROVINSI, "<br/>",
    "Total Output: ", data1$t.output, "<br/>",
    "Komoditas: ", Kom) %>%
    lapply(HTML)
  
  
  
  leaflet(map) %>%
    addPolygons(
      fillColor = ~outputPalette(data1$t.output),
      stroke = TRUE,
      color = 'white',
      fillOpacity = 1,
      weight = 1.5,
      label = map_lab,
      labelOptions = labelOptions(
        style = list("font-weight" = "normal",
                     textsize = "11px",
                     direction = "auto")
      ),
      options = tileOptions(maxZoom = 5)
                     
    ) %>%
    setView( lng = 118
             , lat = -2.5
             , zoom = 5 ) %>%
    setMaxBounds( lng1 = 89.5
                  , lat1 = -14.5
                  , lng2 = 149.5
                  , lat2 = 9.5 ) 

  
  
  
    ## ENDLINE
}