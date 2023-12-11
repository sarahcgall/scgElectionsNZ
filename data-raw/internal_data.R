# ABOUT
# This script creates a regions data frame for all electorates and all election years
# Regions have been grouped, based on Chris Knox et al.'s work at the NZ Herald:
# https://insights.nzherald.co.nz/election/#/d/gridmap/map/ and Devid Frigge's hexmaps:
# https://david.frigge.nz/election2017/hexmaps.html
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# upload
data <- data.frame()
for (i in year) {
  df <- upload(i, "votes-for-registered-parties-by-electorate", 2)
  df <- df %>%
    mutate(Year = as.numeric(i)) %>% # add year and convert to numeric
    filter(str_detect(Electorate, "Total") == FALSE) %>%
    select(Electorate)

  data <- rbind(data,df)
}
# CLEAN
data$Electorate <- iconv(data$Electorate,from="UTF-8",to="ASCII//TRANSLIT") # remove special characters
data <- distinct(data) # remove duplicates
# add regions column
regions <- data %>%
  mutate(Region = case_when(
    # NORTHLAND
    Electorate %in% c("Northland","Whangarei","Te Tai Tokerau") ~ "Northland",
    # AUCKLAND
    Electorate %in% c("Albany","Auckland Central","Botany","Clevedon","East Coast Bays","Epsom","Hauraki",
                      "Helensville","Hunua","Kaipara ki Mahurangi","Kelston","Mangere","Manukau East","Manurewa",
                      "Maungakiekie","Mt Albert","Mt Roskill","Owairaka","New Lynn","Northcote","North Shore",
                      "Port Waikato","Pakuranga","Panmure-Otahuhu","Papakura","Rodney","Takanini","Tamaki",
                      "Tamaki Makaurau","Te Atatu","Titirangi","Upper Harbour","Waitakere","Waipareira",
                      "Whangaparaoa") ~ "Auckland",
    # WELLINGTON / WAIRARAPA
    Electorate %in% c("Hutt South","Wairarapa","Mana","Ohariu","Ohariu-Belmont","Remutaka","Rimutaka",
                      "Rongotai","Wellington Central") ~ "Wellington / Wairarapa",
    # WAIKATO
    Electorate %in% c("Coromandel","Hamilton East","Hamilton West","Hauraki-Waikato","Karapiro","Piako",
                      "Tainui","Taranaki-King Country","Taupo","Waikato") ~ "Waikato",
    # BAY OF PLENTY / HAWKE'S BAY / GISBORNE
    Electorate %in% c("Bay of Plenty","East Coast","Ikaroa-Rawhiti","Mahia","Napier","Rotorua",
                      "Tauranga","Te Puku O Te Whenua","Tukituki","Waiariki") ~ "Bay of Plenty / Hawke's Bay / Gisborne",
    # TARANAKI / WHANGANUI / MANAWATU
    Electorate %in% c("New Plymouth","Palmerston North","Otaki","Rangitikei","Te Tai Hauauru",
                      "Te Tai Rawhiti","Whanganui") ~ "Taranaki / Whanganui / Manawatu",
    # SOUTH ISLAND
    Electorate %in% c("Aoraki","Banks Peninsula","Christchurch Central","Christchurch East",
                      "Clutha-Southland","Dunedin","Dunedin North","Dunedin South","Ilam",
                      "Invercargill","Kaikoura","Nelson","Otago","Port Hills","Rakaia","Rangitata",
                      "Selwyn","Southland","Taieri","Te Tai Tonga","West Coast-Tasman",
                      "Waimakariri","Waitaki","Wigram") ~ "South Island",
    .default = NULL
  ))
regions <- regions[order(regions$Electorate),] # reorder data
rownames(regions) <- NULL # reset index
# save to .rds
usethis::use_data(regions, internal = TRUE, overwrite = TRUE)

# add type column
type <- data %>%
  mutate(Electorate_Type = ifelse(
    Electorate %in% c("Te Tai Tokerau","Te Tai Tonga","Tamaki Makaurau","Te Tai Hauauru","Hauraki-Waikato",
                      "Ikaroa-Rawhiti","Waiariki","Te Puku O Te Whenua","Te Tai Rawhiti","Hauraki","Tainui"), "Maori","General"
  ))
type <- type[order(type$Electorate),] # reorder data
rownames(type) <- NULL # reset index
# save to .rds
sysdata_filenames <- load("R/sysdata.rda")
save(list = c(sysdata_filenames, "type"), file = "R/sysdata.rda")
