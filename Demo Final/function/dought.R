
##---DOUGHT

dought_plot <- function(data, Prov = "Aceh", off = "output"){
  
  #Filtering Data
  data4 <- data %>%
    filter(prov %in% Prov) %>%
    arrange(cat.code)
  
  if(nrow(data) == 0){
    return(NULL)
  }
  
  ## Make Plot
  if (off == "output"){
    fig <- plot_ly(data = data4,
                   labels = ~cat,
                   values = ~output
                   )
  } else {
    fig <- plot_ly(data = data4,
                   labels = ~cat,
                   values = ~ntb
                   )
  }
  

  fig <- fig %>%
    
    add_pie(hole = 0.6) %>%
    
  #  add_text(text = str_glue("Total Output {sum(data4$output)} Miliar Rupiah"),
  #           size = 14,
  #           x = 20,
  #           y = 20,
  #           z = NULL) %>%
    
    layout(
           #title = stringr::str_glue("Perbandingan Output Provinsi {Prov} Berdasarkan Sektor \n(Miliar Rupiah)"),
           xaxis = list(title = ''),
           yaxis = list(title = 'Output'),
          # margin = list(t = 100),
           paper_bgcolor = "rgba(0,0,0,0)"
           )%>%
    
    config(modeBarButtonsToRemove = c('zoom2d',
                                      'pan2d',
                                      'hoverClosestCartesian',
                                      'hoverCompareCartesian',
                                      'select2d',
                                      'zoomIn2d',
                                      'zoomOut2d',
                                      'autoscale2d',
                                      'lasso2d',
                                      'toggleSpikelines'),
           displaylogo = FALSE) %>%
    layout(showlegend = F,
           hovermode = "closest",
           font = list(family = "Open Sans",
                       color = "white"
                       ))
}
