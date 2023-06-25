
##---BAR

bar_plot <- function(data, Prov = "Aceh"){
  
  #Filtering Data
  data2 <- data %>%
    filter(prov %in% Prov)
  
  data2$cat.code <- factor(data2$cat.code,
                  levels = data2$cat.code[order(
                    data2$t.intermediate, decreasing = TRUE)])
  
  
  
  if(nrow(data) == 0){
    return(NULL)
  }

  ## GGPLOTLY

  
 fig <- ggplot(data2,
                aes(x = cat.code,
                    y = t.intermediate,
                    fill = cat)) +
    geom_bar(stat = 'identity')+
   scale_fill_hue(h = c(0, 250),
                  c = 65,
                  l = 90)+
    coord_flip()  +
   ylab("Input Antara") +
   xlab("Kode Komoditas")
  
  ggplotly(fig) %>%

    layout(
           showlegend =F,
           legend = list(orientation = "h"),
           height = 500,
           hovermode = 'closest',
           paper_bgcolor = "rgba(0,0,0,0)")
}

bar_plot01 <- function(data, Prov = "Aceh"){
  
  #Filtering Data
  data2 <- data %>%
    filter(prov %in% Prov)
  
  data2$cat.code <- factor(data2$cat.code,
                           levels = data2$cat.code[order(
                             data2$final.demand, decreasing = TRUE)])
  
  
  
  if(nrow(data) == 0){
    return(NULL)
  }
  
  ## GGPLOTLY
  
  
  fig <- ggplot(data2,
                aes(x = cat.code,
                    y = final.demand,
                    fill = cat)) +
    geom_bar(stat = 'identity')+
    scale_fill_hue(h = c(0, 250),
                   c = 65,
                   l = 90)+
    coord_flip()  +
    ylab("Permintaan") +
    xlab("Kode Komoditas")
  
  ggplotly(fig) %>%
    
    layout(
      showlegend =F,
      legend = list(orientation = "h"),
      height = 500,
      hovermode = 'closest',
      paper_bgcolor = "rgba(0,0,0,0)")
}
