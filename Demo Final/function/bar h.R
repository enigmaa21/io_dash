
##---BAR

bar_plot_h <- function(data, Prov = "Aceh"){
  
  #Filtering Data
  data2 <- data %>%
    filter(prov %in% Prov) %>%
    arrange(ntb)
  
  if(nrow(data) == 0){
    return(NULL)
  }
  
  ## Make Plot
  plot_ly(data = data2,
          x = ~cat.code,
          y = ~t.intermediate,
          type = "bar",
          color = ~cat,
          xlab = NULL) %>%
    layout(title = stringr::str_glue("Perbandingan Nilai Tambah Bruto (NTB) - Provinsi {Prov} - Berdasarkan Sektor \n(Juta Rupiah)"),
           xaxis = list(title = ''),
           yaxis = list(title = 'NTB'),
           height = 700,
           
           margin = list (t = 100)
           )%>%
    coord_flip() %>%
    
   # highlight(on = "plotly_click",
    #          dynamic = T,
     #         selectize = T,
      #        persistent = T,
       #       selected = attrs_selected(opacity = 0.3)) %>%
  
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
    layout(#legend = list(x = 0.75, y = 0.9),
           font = list(color = "white"),
           paper_bgcolor = "rgba(0,0,0,0)",
           legend = list(orientation = "h"))
}
