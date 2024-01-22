# ABOUT
# This script creates a regions data frame for all electorates and all election years
# Regions have been grouped, based on Chris Knox et al.'s work at the NZ Herald:
# https://insights.nzherald.co.nz/election/#/d/gridmap/map/ and Devid Frigge's hexmaps:
# https://david.frigge.nz/election2017/hexmaps.html
# =====================================#
# LIBRARIES/FUNCTIONS
source("data-raw/utils.R")
# =====================================#
# Upload and process data
data <- do.call(rbind, lapply(year, function(i) {
  upload(i, "votes-for-registered-parties-by-electorate", 2) %>%
    mutate(Year = as.numeric(i)) %>%
    filter(!str_detect(Electorate, "Total")) %>%
    select(Electorate) %>%
    distinct() # remove duplicates
}))

# add regions column
region <- data %>%
  mutate(Region = case_when(
    # NORTHLAND
    Electorate %in% c("Northland", "Whangarei", "Te Tai Tokerau") ~ "Northland",
    # AUCKLAND
    Electorate %in% c("Albany", "Auckland Central", "Botany", "Clevedon", "East Coast Bays", "Epsom", "Hauraki",
                      "Helensville", "Hunua", "Kaipara ki Mahurangi", "Kelston", "Mangere", "Manukau East", "Manurewa",
                      "Maungakiekie", "Mt Albert", "Mt Roskill", "Owairaka", "New Lynn", "Northcote", "North Shore",
                      "Port Waikato", "Pakuranga", "Panmure-Otahuhu", "Papakura", "Rodney", "Takanini", "Tamaki",
                      "Tamaki Makaurau", "Te Atatu", "Titirangi", "Upper Harbour", "Waitakere", "Waipareira",
                      "Whangaparaoa") ~ "Auckland",
    # WELLINGTON / WAIRARAPA
    Electorate %in% c("Hutt South", "Wairarapa", "Mana", "Ohariu", "Ohariu-Belmont", "Remutaka", "Rimutaka",
                      "Rongotai", "Wellington Central") ~ "Wellington / Wairarapa",
    # WAIKATO
    Electorate %in% c("Coromandel", "Hamilton East", "Hamilton West", "Hauraki-Waikato", "Karapiro", "Piako",
                      "Tainui", "Taranaki-King Country", "Taupo", "Waikato") ~ "Waikato",
    # BAY OF PLENTY / HAWKE'S BAY / GISBORNE
    Electorate %in% c("Bay of Plenty", "East Coast", "Ikaroa-Rawhiti", "Mahia", "Napier", "Rotorua",
                      "Tauranga", "Te Puku O Te Whenua", "Tukituki", "Waiariki") ~ "Bay of Plenty / Hawke's Bay / Gisborne",
    # TARANAKI / WHANGANUI / MANAWATU
    Electorate %in% c("New Plymouth", "Palmerston North", "Otaki", "Rangitikei", "Te Tai Hauauru",
                      "Te Tai Rawhiti", "Whanganui") ~ "Taranaki / Whanganui / Manawatu",
    # SOUTH ISLAND
    Electorate %in% c("Aoraki", "Banks Peninsula", "Christchurch Central", "Christchurch East",
                      "Clutha-Southland", "Dunedin", "Dunedin North", "Dunedin South", "Ilam",
                      "Invercargill", "Kaikoura", "Nelson", "Otago", "Port Hills", "Rakaia", "Rangitata",
                      "Selwyn", "Southland", "Taieri", "Te Tai Tonga", "West Coast-Tasman",
                      "Waimakariri", "Waitaki", "Wigram") ~ "South Island",
    .default = NULL
  )) %>%
  arrange(Electorate) %>%
  select(Electorate, Region) %>%
  distinct()

# save to .rds
usethis::use_data(region, internal = TRUE, overwrite = TRUE)

# ==============================================================#
# add type column
type <- data %>%
  mutate(Electorate_Type = ifelse(
    Electorate %in% c("Te Tai Tokerau", "Te Tai Tonga", "Tamaki Makaurau", "Te Tai Hauauru", "Hauraki-Waikato",
                      "Ikaroa-Rawhiti", "Waiariki", "Te Puku O Te Whenua", "Te Tai Rawhiti", "Hauraki", "Tainui"),
    "Maori", "General"
  )) %>%
  arrange(Electorate) %>% # reorder data
  distinct()

# Save type data
save_to_rds("type")

# ==============================================================#
# successful parties correspondence
data(summary)
party <- unique(summary[c("Election", "Party", "Successful")])
party <- summary %>%
  select(Election, Party, Successful) %>%
  distinct() %>%
  mutate(new_name = if_else(Successful == "No", "Other", Party))

# Create informals dataframe
informals <- data.frame(
  Election = unique(party$Election),
  Party = "Informal",
  new_name = "Informal"
)

# Combine party and informals dataframes
party <- party %>%
  bind_rows(informals) %>%
  arrange(Election)

# Save type data
save_to_rds("party")

# ==============================================================#
# electorate name correspondence
data(turnout)
electorate <- unique(turnout[c("Election", "Electorate")])

electorate <- electorate %>%
  mutate(new_name = case_when(
    # 2020 changes
    Electorate == "Helensville" ~ "Kaipara ki Mahurangi",
    Electorate == "Rodney" ~ "Whangaparaoa",
    Electorate == "Manukau East" ~ "Panmure-Otahuhu",
    Electorate == "Flat Bush" ~ "Takanini",
    Electorate == "Hunua" & !Election %in% c(1996, 1999) ~ "Port Waikato",
    # NB Takanini = new electorate in South Auckland
    # pre 2020 changes
    Electorate == "Albany" ~ "East Coast Bays",
    Electorate == "Aoraki" ~ "Rangitata",
    Electorate == "Hunua" & Election %in% c(1996, 1999) ~ "Papakura",
    Electorate == "Clevedon" ~ "Papakura",
    Electorate %in% c("Karapiro", "Piako") ~ "Waikato",
    Electorate == "Mahia" ~ "East Coast",
    Electorate == "Otago" ~ "Waitaki",
    Electorate == "Owairaka" ~ "Mt Albert",
    Electorate == "Rakaia" ~ "Selwyn",
    Electorate == "Titirangi" ~ "New Lynn",
    # NB Waipareira merged with Waitakere in 1999 then Waitakere splits into Kelston and Upper Harbour
    # NB Botany = new electorate in 2008
    TRUE ~ Electorate  # Default case
  ))

# Save electorate data
save_to_rds("electorate")
