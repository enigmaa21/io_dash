
##---BAR

bar_plot0 <- function(data, Prov = "Aceh"){
  
  #Filtering Data
  data2 <- data %>%
    filter(prov %in% Prov)
  
  data2$cat.code <- factor(data2$cat.code,
                  levels = data2$cat.code[order(
                    data2$output, decreasing = F)])
  
  
  data3 <- head(data2, 5)
  
  if(nrow(data) == 0){
    return(NULL)
  }
  
  ## GGPLOTLY

  
 fig <- ggplot(data3,
                aes(x = cat.code,
                    y = output,
                    fill = cat)) +
    geom_bar(stat = 'identity')+
   scale_fill_hue(h = c(0, 250),
                  c = 65,
                  l = 90)+
    coord_flip()  +
   ylab("Nilai Output") +
   xlab("Kode Komoditas")
  
  ggplotly(fig) %>%

    layout(
           showlegend =F,
           legend = list(orientation = "h"),
           height = 500,
           hovermode = 'closest',
           paper_bgcolor = "rgba(0,0,0,0)")
  
} 
  bar_plot00 <- function(data, Prov = "Aceh"){
    
    #Filtering Data
    data2 <- data %>%
      filter(prov %in% Prov)
    
    data2$cat.code <- factor(data2$cat.code,
                             levels = data2$cat.code[order(
                               data2$ntb, decreasing = F)])
    
    
    data3 <- head(data2, 5)
    
    if(nrow(data) == 0){
      return(NULL)
    }
    
    ## GGPLOTLY
    
    
    fig <- ggplot(data3,
                  aes(x = cat.code,
                      y = ntb,
                      fill = cat)) +
      geom_bar(stat = 'identity')+
      scale_fill_hue(h = c(0, 250),
                     c = 65,
                     l = 90)+
      coord_flip()  +
      ylab("Total NTB") +
      xlab("Kode Komoditas")
    
    ggplotly(fig) %>%
      
      layout(
        showlegend =F,
        legend = list(orientation = "h"),
        height = 500,
        hovermode = 'closest',
        paper_bgcolor = "rgba(0,0,0,0)")
  
  }  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

