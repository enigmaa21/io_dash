
#---USER INTERFACE---#

server = function(input, output, session) {
  useAutoColor()
  
  

  # update sidebar ----------------------------------------------------------
  
  observeEvent(input$sidebarToggle, {
    updateSidebar(id = "sidebar")
  })
  
  # user messages -----------------------------------------------------------
  
  observeEvent(input$add_message, {
    updateUserMessages(
      "message",
      action = "add",
      content = list(
        author = "Saiban",
        date = "Now",
        image = "https://i.pinimg.com/originals/f1/15/df/f115dfc9cab063597b1221d015996b39.jpg",
        type = "received",
        text = "Message content"
      )
    )
  })
  
  
  # user menu ---------------------------------------------------------------
  
  output$user <- renderUser({
    dashboardUser(
      name = "Raja Saiban",
      image = "sai.jpg",
      title = "IO-Dashboard",
      subtitle = "Mahasiswa Medioker",
      footer = p("", class = "text-center"),
      fluidRow(
        dashboardUserItem(
          width = 6,
          "212011429"
        ),
        dashboardUserItem(
          width = 6,
          "3SE1"
        )
      )
    )
  })
  
  
  ##---DATA PLOT--------------
  data_plot <- reactive({io_data %>%
    filter(prov %in% input$prov1)
  })
  
  ##---MAP PLOT--------------
  output$map_out <- renderLeaflet({
    map_plot(catA)
  })
  
  ##---MAP PLOT OUTPUT--------------
  output$chor_map <- renderLeaflet({
    chor_map(data = io_data,
             Kom  = input$kom1)
  })
  
  
  ##---DOUGHT PLOT OUTPUT--------------
  output$dought_out <- renderPlotly({
    dought_plot(data = io_data,
                Prov = input$prov2,
                off = "output")
  })
  
  ##---DOUGHT PLOT NTB--------------
  output$dought_ntb <- renderPlotly({
    dought_plot(data = io_data,
                Prov = input$prov2,
                off = "ntb")
  }) 
  
  ##---BAR PLOT NTB--------------
#  output$bar_plot2 <- renderPlotly({
#    bar_plot_h(
#      data = io_data,
#      Prov = input$prov1
#    )
#  })
  
  
  ##---TABLE OUTPUT--------------
  observeEvent(input$map_out_marker_click, { 

    terpilih <- NULL
    p <- input$map_out_marker_click 
    
    p_lat = p$lat
    
    terpilih <- which(catA$Latitude == p_lat)
  
    if(!is.null(terpilih)){
      b <- catA[terpilih,1]
    } else {
      b <- "Aceh" 
    }
    
    
  output$tabel_out <- renderDataTable({
    df <- io_data %>%
            filter(prov %in% b) %>%
            select(c(prov, cat.code, cat, rntb, output, output.multiplier))
    
    df$output <- round(df$output, 2)
    df$output.multiplier <- round(df$output.multiplier, 2)
    df$rntb <- round(df$rntb, 2)
    
      colnames(df) <- (c("Provinsi", "Kode", "Kategori", "Rasio NTB", "Output (Juta Rp)", "Output Multiplier"))
      
      df

  }, options = list(pageLength = 25))
  
  
  output$bar_plot4 <- renderPlotly({
    bar_plot0 (data = io_data,
              Prov = input$prov1)
  })
  
  output$bar_plot5 <- renderPlotly({
    bar_plot00 (data = io_data,
               Prov = input$prov1)
  })
  })
  
  
  ##---STACK PLOT INTERMEDIATE--------------
  output$stack_plot1 <- renderPlotly({
    stack_plot(
      data = io_data,
      Prov = input$prov1
    )
  })
  
  
  ##---STACK PLOT INPUT-OUTPUT--------------
  output$stack_plot2 <- renderPlotly({
    stack_plot0(
      data = io_data,
      Prov = input$prov2
    )
  })
  
  
  ##---TEXT OUTPUT 2--------------
  output$text_3 <- renderText({
    text_data <- io_data %>%
      filter(prov %in% input$prov2)
    round(sum(text_data$t.intermediate),2)
  })
  
  output$text_4 <- renderText({
    text_data <- io_data %>%
      filter(prov %in% input$prov2)
    round(sum(text_data$output),2)
  })
  
  output$text_5 <- renderText({
    text_data <- io_data %>%
      filter(prov %in% input$prov2)
    round(sum(text_data$ntb),2)
  })
  
  output$text_6 <- renderText({
    text_data <- io_data %>%
      filter(prov %in% input$prov2)
    round(sum(text_data$final.demand),2)
  })
  
  output$head_text1 <- renderText({
    str_glue("Total Output Komoditas: {input$kom1}")
  })
  
  output$head_text2 <- renderText({
    str_glue("Total Proporsi Output Provinsi {input$prov2}")
  })
  
  output$head_text3 <- renderText({
    str_glue("Proporsi Nilai Tambah Bruto {input$prov2}")
  })
  
  output$head_text4 <- renderText({
    str_glue("Proporsi Asal Input-Output {input$prov2}")
  })
  
  ##---BAR PLOT INTERMEDIATE--------------
  output$bar_plot1 <- renderPlotly({
    bar_plot(
      data = io_data,
      Prov = input$prov1
    )
  })
  
  ##---TABEL INTERMEDIATE--------------
  output$text_inter_tabel <- renderText({
    Prov <- input$prov1
    str_glue("Tabel Ringkasan Input Antara Provinsi {Prov} \n(Juta Rupiah)")
  })
  
  
  output$tabel_inter <- renderDataTable({
    df <- io_data %>%
      filter(prov %in% input$prov1) %>%
      select(c(prov, cat, cat.code, d.intermediate, f.intermediate, t.intermediate))
    
    df$d.intermediate <- round(df$d.intermediate, 2)
    df$f.intermediate <- round(df$f.intermediate, 2)
    df$t.intermediate <- round(df$t.intermediate, 2)
    
    colnames(df) <- (c("Provinsi", "Komoditas", "Kode", "Input Domestik", "Input Internasional", "Total Input"))
    
    df
    
  }, options = list(pageLength = 25))
  
  
  ##---BAR PLOT DEMAND--------------
  output$bar_plot11 <- renderPlotly({
    bar_plot01(
      data = io_data,
      Prov = input$prov1
    )
  })
  
  ##---STACK PLOT DEMAND--------------
  output$stack_plot11 <- renderPlotly({
    stack_plot(
      data = io_data,
      Prov = input$prov1,
      Cat = "Final Demand"
    )
  })
  
  ##---TABEL DEMAND--------------
  output$text_demand_tabel <- renderText({
    Prov <- input$prov1
    str_glue("Tabel Ringkasan Permintaan Provinsi {Prov} \n(Juta Rupiah)")
  })
  
  
  output$tabel_demand <- renderDataTable({
    df <- io_data %>%
      filter(prov %in% input$prov1) %>%
      select(c(prov, cat, cat.code, d.final.demand, f.final.demand, final.demand, income.multiplier))
    
    df$d.final.demand <- round(df$d.final.demand, 2)
    df$f.final.demand <- round(df$f.final.demand, 2)
    df$final.demand <- round(df$final.demand, 2)
    df$income.multiplier <- round(df$income.multiplier,2)
    
    colnames(df) <- (c("Provinsi", "Komoditas", "Kode", "Demand Domestik", "Demand Internasional", "Total Demand", "Income Multiplier"))
    
    df
    
  }, options = list(pageLength = 25))
  
  
  ##---TABEL DOWNLOAD--------------
  
  datasetInput <- reactive({
    switch(input$dataset,
           "DataSetIRIO" = irio_data,
           "DataSetIO" = io_data.tab )
  })
  
 # output$tabel_down <- renderTable({
#    io_data.tab
#  })
  
  output$donwloadData <- downloadHandler(
    filename = function (){
      paste (input$dataset, ".csv", sep = "")
    },
    
    content = function(file){
      write.csv(datasetInput(),
                file,
                row.names = FALSE)
    }
  )
  
  
  
      showModal(modalDialog(
        title = "Selamat Datang di Dashboard Input-Output!",
        "Dashboard ini ditujukan agar memudahkan dalam membaca tabel IO
         yang dibuat ke bentuk visual. Silakan gunakan tombol 'Pilih Wilayah'
         untuk memfilter dialog",
        easyClose = F
      ))

  
  
  
  ## ENDLINE ==================================================================
}
