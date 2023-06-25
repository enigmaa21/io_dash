
##---STACK

stack_plot0 <- function(data, 
                       Prov = "Aceh" 
                       ){
  
  #Filtering Data
  data16 <- data[,c(1,8,9,10,13,14,15)] %>%
    filter(prov %in% Prov)
  
  data17 <- data16 %>%
    summarize(d.intermediate = sum(d.intermediate),
              f.intermediate = sum(f.intermediate),
              t.intermediate = sum(t.intermediate),
              final.demand = sum(final.demand),
              f.final.demand = sum(f.final.demand),
              d.final.demand = sum(d.final.demand)) %>%
    
    mutate(d.int.persen = round(d.intermediate/t.intermediate*100,2),
           f.int.persen = round(f.intermediate/t.intermediate*100,2),
           d.out.persen = round(d.final.demand/final.demand*100,2),
           f.out.persen = round(f.final.demand/final.demand*100,2))
  
  data18 <- data17[,c(7,8,9,10)] %>%
    pivot_longer(c(d.int.persen, f.int.persen, d.out.persen, f.out.persen),
                 names_to = "Proporsi",
                 values_to = "Percentage") %>%
    mutate(Proporsi = if_else(Proporsi == "d.int.persen",
                              "Input Domestik",
                              if_else(Proporsi == "f.int.persen",
                                      "Input Internasional",
                                      if_else(Proporsi == "d.out.persen",
                                              "Output Domestik",
                                              "Output Internasional"
                                      ))
    ))
  data19 <- cbind(kat = c("Input", "Input",
                          "Output", "Output"), data18)
  
  if(nrow(data) == 0){
    return(NULL)
  }
  
  
  stack_lab <- paste(
    "Provinsi: ", data16$prov, "<br/>",
    "Tipe: ", data17$Proporsi, "<br/>",
    "Persentase: ", data17$Percentage) %>%
    lapply(HTML)
  
  
  
  ## Make Plot
  fig <- highlight_key(data19, ~Proporsi)
  
  
  fig1 <- ggplot(fig,
                aes(x = kat,
                    y = Percentage,
                    fill = Proporsi)) +
    geom_bar(stat = "identity",
             position = "fill")+
    coord_flip()+
    scale_fill_brewer(palette = "Pastel2")+
    ylab(NULL)+
    xlab(NULL) 
    
  
  fig1 <- ggplotly(fig1,
                   height = 350,
                   label = stack_lab,
                   orientation = "h") %>%
                    
                    layout(legend = list(orientation = "h"),
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
           displaylogo = FALSE)
    
  
  return(fig1)
}



