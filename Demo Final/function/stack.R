
##---STACK

stack_plot <- function(data, 
                       Prov = "Aceh", 
                       Cat = "Intermediate Input"){
  
  #Filtering Data
  data1 <- data %>%
    filter(prov %in% Prov) %>%
    arrange(cat.code)
  
  if(nrow(data) == 0){
    return(NULL)
  }
  
  
  if (Cat == "Intermediate Input") {
    tot <- data1[,"t.intermediate"]
    data1 <- data1 %>%
      pivot_longer(c("prop.domestic","prop.foreign"),
                   names_to = "Proporsi",
                   values_to = "percentage")%>%
      mutate(Proporsi = if_else(Proporsi == "prop.domestic",
                                  "Proporsi Bahan Baku Domestik",
                                  "Proporsi Bahan Baku Internasional"))
    
  } else {
  
  if (Cat == "Final Demand") {
    tot <- data1[,"final.demand"]
    data1 <- data1 %>%
      pivot_longer(c("prop.dfinal.demand","prop.ffinal.demand"),
                   names_to = "Proporsi",
                   values_to = "percentage") %>%
      mutate(Proporsi = if_else(Proporsi == "prop.dfinal.demand",
                                  "Proporsi Permintaan Domestik",
                                  "Proporsi Permintaan Internasional"))
    
  }
}
  
  
  
  ## Make Plot
  fig <- highlight_key(data1, ~Proporsi)
  
  
  fig1 <- ggplot(fig,
                aes(x = cat.code,
                    y = percentage,
                    fill = Proporsi)) +
    geom_bar(stat = "identity",
             position = "fill")+
    scale_fill_brewer(palette = "Set2")+
    ylab(NULL)+
    xlab(NULL) 
    
  
  fig1 <- highlight(ggplotly(fig1,
                             height = 500,
                  orientation = "h") %>%
                    
                    layout(legend = list(orientation = "h")
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
           displaylogo = FALSE),
    "plotly_click",
    selectize = F,
    dynamic = F
    )
  
  return(fig1)
}