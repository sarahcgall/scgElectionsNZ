# This script contains the functions necessary for raw data processing
# =====================================#
# LIBRARIES
library("tidyverse")
# =====================================#
# FUNCTIONS
# Function to upload data files
upload <- function(year, file, row_no){
  df <- read.csv(paste0("data-raw/vote-data", "/", year, "/", file, ".csv"), skip = row_no,
                 encoding = "UTF-8") # remove all special characters
}
# for loops to add to one document
year <- c("2023", "2020", "2017", "2014", "2011", "2008", "2005", "2002", "1999", "1996")

# Function to amend party names to be the same across all elections
amend_parties <- function(df, column) {
  df <- df %>%
    mutate({{ column }} := case_when(
      {{ column }} == "X99 MP Party" ~ "99 MP Party",
      {{ column }} %in% c("ACT", "ACT New Zealand") ~ "ACT Party",
      {{ column }} == "Aotearoa NZ Youth" ~ "Aotearoa NZ Youth Party",
      {{ column }} == "Aroha-Ngia-Tatou" ~ "Aroha Ngia Tatou",
      {{ column }} == "Ban1080" ~ "Ban 1080",
      {{ column }} == "Blokes Liberation" ~ "Blokes Liberation Front",
      {{ column }} %in% c("Christian Heritage NZ","Christian Heritage Party of New Zealand", "Christian Heritage Nz",
                          "Christian Heritage Party") ~ "Christian Heritage",
      {{ column }} %in% c("Conservative","NZ Conservative Party") ~ "Conservative Party",
      {{ column }} == "HeartlandNZ" ~ "Heartland NZ",
      {{ column }} == "Human Rights" ~ "Human Rights Party",
      {{ column }} %in% c("Candidate Informals","Informal Party Votes","Party Informals") ~ "Informal",
      {{ column }} %in% c("Independents   parties with no list candidates", "Independent") ~ "Independents",
      {{ column }} == "Legalise Cannabis" ~ "Aotearoa Legalise Cannabis Party",
      {{ column }} == "Libertariannz" ~ "Libertarianz",
      {{ column }} %in% c("MANA Movement","Mana Maori","Mana Maori Movement","Mana") ~ "MANA",
      {{ column }} %in% c("McGillicuddy Serious","Mcgillicuddy Serious") ~ "McGillicuddy Serious Party",
      {{ column }} %in% c("Nga Iwi","Nga Iwi Morehu Movement") ~ "Nga Iwi Morehu",
      {{ column }} %in% c("NZ Econ. Euth.","NZ Economic Euthenics") ~ "NZ Economic Euthenics Party",
      {{ column }} == "NZ Equal Rights" ~ "NZ Equal Rights Party",
      {{ column }} == "New Zealand First Party" ~ "NZ First",
      {{ column }} == "New Zealand People s Party" ~ "New Zealand People's Party",
      {{ column }} == "Nmp" ~ "NMP",
      {{ column }} %in% c("Progressive Coalition","Jim Anderton s Progressive",
                          "Jim Anderton s Progressive Coalition") ~ "Jim Anderton's Progressive",
      {{ column }} == "ONE Party" ~ "OneNZ Party",
      {{ column }} == "Outdoor Rec  Nz" ~ "Outdoor Rec NZ",
      {{ column }} == "Others" ~ "Other",
      {{ column }} == "RAM   Residents Action Movement" ~ "RAM - Residents Action Movement",
      {{ column }} == "Republican" ~ "Republican Party",
      {{ column }} == "The Opportunities Party  TOP " ~ "The Opportunities Party (TOP)",
      {{ column }} == "The Republic of New Zealand Party" ~ "Republic of New Zealand Party",
      {{ column }} == "Workers Party of New Zealand" ~ "Workers Party",
      {{ column }} %in% c("United Future New Zealand","United NZ","United New Zealand Party",
                          "United New Zealand") ~ "United Future", .default = {{ column }}
    ))
}
