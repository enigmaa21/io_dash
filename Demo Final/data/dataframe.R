
##---DATA

io_data <- read_xlsx("data/data_io_code.xlsx")%>%
  as.data.frame()

io_data.tab <- read_xlsx("data/data_IO.xlsx") %>%
  as_tibble()

io_wilayah <- unique(io_data$prov)
io_komoditas <- c("Seluruh Komoditas",unique(io_data$cat)) %>%
  as.vector()

irio_data <- read_xlsx("data/data.IRIO.xlsx")

peta <- read.csv("data/titik peta2.csv") %>%
  as.data.frame()


peta_data <- inner_join(io_data, peta, by = "prov")

map <- readOGR("shp/Administrasi_Provinsi.shp")

#colnames(map) <- c("id", "prov","Shape_Leng", "Shape_Area", "Langitude", "Lattitude", "geometry")


catA <- read.csv("data/cat_A.csv") %>%
  as.data.frame()
