
#---USER INTERFACE---#

ui = dashboardPage(
  
  preloader = list(html = tagList(spin_1(), "Loading ..."), color = "#343a40"),
  dark = TRUE,
  help = TRUE,
  fullscreen = TRUE,
  scrollToTop = TRUE,
  
 ## HEADER ----------------
  header = dashboardHeader(
    title = dashboardBrand(
      title = sprintf("IO DASHBOARD"),
      color = "primary",
      opacity = 0.8
    ),
    fixed = TRUE,
    tooltip(
      title = "Pilih Wilayah",
      placement = "bottom",
      actionButton(inputId = "controlbarToggle", 
                   label = "Pilih Wilayah", 
                   class = "mx-2")
    ),


    rightUi = tagList(
      userOutput("user")
    )
  ),

 ## SIDEBAR ----------------
  sidebar = dashboardSidebar(
    fixed = TRUE,
    skin = "light",
    status = "primary",
    id = "sidebar",
    customArea = fluidRow(
    ),
    sidebarUserPanel(
      image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png",
      name = "Welcome Onboard!"
    ),
    sidebarMenu(
      id = "current_tab",
      flat = FALSE,
      compact = FALSE,
      childIndent = TRUE,
      sidebarHeader("Menu Items"),
      menuItem(
        "Home",
        badgeColor = "success",
        tabName = "Output",
        icon = icon("warehouse")
      ),
      menuItem(
        "Ouput",
        tabName = "Map",
        icon = icon("truck-fast")
      ),
      menuItem(
        "Input",
        tabName = "Inter",
        icon = icon("dolly")
      ),
      menuItem(
        "Demand",
        tabName = "demand",
        icon = icon("box")
      ),
      menuItem(
        "Dataset",
        tabName = "down",
        icon = icon("layer-group")
      )
      )
    ),
 
 ## BODY ----------------
  body = dashboardBody(

    tabItems(
      Map_tab,
      output_tab,
      intermediate_tab,
      demand_tab,
      download_tab
    )
  ),
  controlbar = dashboardControlbar(
    id = "controlbar",
    skin = "light",
    pinned = TRUE,
    overlay = TRUE,
    controlbarMenu(
      id = "controlbarMenu",
      type = "pills",
      controlbarItem(
        "Inputs",
        column(
          width = 12,
          align = "center",
          
          selectInput(
            inputId = "tahun2",
            label = "Pilih Tahun",
            choices = c("2016"),
            selected = "2016",
            multiple = F
          ),
          
          selectizeInput(
            inputId = "prov1",
            label = "Pilih Wilayah",
            choices = io_wilayah,
            selected = "Aceh",
            multiple = F
          )
        )
      )
    )
  ),
 
 ## FOOTER ----------------
  footer = dashboardFooter(
    fixed = FALSE,
    left = a(
      href = "https://instagram.com/dearsaiban",
      target = "_blank", "@dearsaiban"
    ),
    right = "Credit: bs4Dash "
  ),
  title = "bs4Dash Showcase"
)