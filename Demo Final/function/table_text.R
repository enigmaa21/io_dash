
##---OUTPUT TABLE TEXT

 kom.text <- function(data, 
                      Prov = "Aceh",
                      i = 1){
   data1 <- data %>%
     filter (prov %in% Prov)
   data1 <- arrange(data1, desc(output))
 kom <- data1$cat[i]
 
 return(kom)
 }
 
 
 tot.text <- function(data, 
                      Prov = "Aceh",
                      i = 1){
   data1 <- data %>%
     filter (prov %in% Prov) %>%
     arrange(desc(output))
   out <- data1$output[i]
  
  return(out)
 }
 
 per.text <- function(data, 
                      Prov = "Aceh",
                      i = 1){
   data1 <- data %>%
     filter (prov %in% Prov) %>%
     arrange(desc(output))
   kom <- stringr::str_glue("{round(data1$output[i]/sum(data1$output)*100, 2)} %")
   
   return(kom)
 }
 
 mult.text <- function(data, 
                      Prov = "Aceh",
                      i = 1){
   data1 <- data %>%
     filter (prov %in% Prov) %>%
     arrange(desc(output))
   kom <- round(data1$output.multiplier[i], 2)
   
   return(kom)
 }








