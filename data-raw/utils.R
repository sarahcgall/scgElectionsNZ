# This script contains the functions necessary for raw data processing
# =====================================#
# LIBRARIES
library("tidyverse")
# =====================================#
# FUNCTIONS
# Function to upload data files
upload <- function(year, file, row_no) {
  path <- paste0("data-raw/vote-data", "/", year, "/", file, ".csv")

  if (!file.exists(path)) {
    stop("File does not exist: ", path)
  }

  tmp <- read.csv(path, skip = row_no, encoding = "UTF-8")

  # Apply iconv to every column with characters to remove special characters
  tmp <- data.frame(lapply(tmp, function(x) {
    if (is.character(x)) {
      iconv(x, from = "UTF-8", to = "ASCII//TRANSLIT")
    } else {
      x
    }
  }))

  return(tmp)
}

# Better function to integrate at a later date:
# NB work out how to properly remove special characters eg ā
# upload_and_preprocess <- function(year, file, row_no = 0) {
#   path <- paste0("data-raw/vote-data/", year, "/", file, ".csv")
#
#   if (!file.exists(path)) {
#     stop("File does not exist: ", path)
#   }
#
#   read_csv(path, skip = row_no, show_col_types = FALSE) %>%
#     mutate(across(where(is.character), ~iconv(., from = "UTF-8", to = "ASCII//TRANSLIT"))) %>%
#     return()
# }

# Function to get paths of all files in a folder
paths <- function(year, folder) {
  tmp <- list.files(path = paste0("data-raw/vote-data/", year, "/", folder, "/"),
                    pattern = ".csv", all.files = TRUE, full.names = TRUE)
}

# for loops to add to one document
year <- c("2023", "2020", "2017", "2014", "2011", "2008", "2005", "2002", "1999", "1996")

# Function to amend party names to be the same across all elections
amend_parties <- function(df, column) {
  tmp <- df %>%
    mutate({{ column }} := str_trim({{ column }})) %>% # first try removing white spaces
    mutate({{ column }} := case_when(
      {{ column }} == "X99 MP Party" ~ "99 MP Party",
      {{ column }} %in% c("ACT", "ACT New Zealand") ~ "ACT Party",
      {{ column }} == "Aotearoa NZ Youth" ~ "Aotearoa NZ Youth Party",
      {{ column }} == "Aroha-Ngia-Tatou" ~ "Aroha Ngia Tatou",
      {{ column }} == "Ban1080" ~ "Ban 1080",
      {{ column }} == "Blokes Liberation" ~ "Blokes Liberation Front",
      {{ column }} %in% c("Christian Heritage NZ", "Christian Heritage Party of New Zealand", "Christian Heritage Nz",
                          "Christian Heritage Party") ~ "Christian Heritage",
      {{ column }} %in% c("Conservative", "NZ Conservative Party") ~ "Conservative Party",
      {{ column }} == "Democrats For Social Credit" ~ "Democrats for Social Credit",
      {{ column }} == "HeartlandNZ" ~ "Heartland NZ",
      {{ column }} == "Human Rights" ~ "Human Rights Party",
      {{ column }} %in% c("Candidate Informals", "Informal Party Votes", "Party Informals",
                          "Informal Candidate Votes") ~ "Informal",
      {{ column }} %in% c("Independents   parties with no list candidates", "Independent") ~ "Independents",
      {{ column }} == "Internet Mana" ~ "Internet MANA",
      {{ column }} == "Leighton Baker" ~ "Leighton Baker Party",
      {{ column }} == "Legalise Cannabis" ~ "Aotearoa Legalise Cannabis Party",
      {{ column }} == "Libertariannz" ~ "Libertarianz",
      {{ column }} %in% c("MANA Movement", "Mana Maori", "Mana Maori Movement", "Mana") ~ "MANA",
      {{ column }} %in% c("Te Pati Maori", "M e2 ori Party") ~ "Maori Party",
      {{ column }} %in% c("McGillicuddy Serious", "Mcgillicuddy Serious") ~ "McGillicuddy Serious Party",
      {{ column }} %in% c("Nga Iwi", "Nga Iwi Morehu Movement") ~ "Nga Iwi Morehu",
      {{ column }} %in% c("NZ Econ. Euth.", "NZ Economic Euthenics", "Euth") ~ "NZ Economic Euthenics Party",
      {{ column }} == "NZ Equal Rights" ~ "NZ Equal Rights Party",
      {{ column }} == "New Zealand Family Rights Protec" ~ "New Zealand Family Rights Protection Party",
      {{ column }} == "New Zealand First Party" ~ "NZ First",
      {{ column }} == "NZ Loyal" ~ "New Zealand Loyal",
      {{ column }} == "New Zealand People s Party" ~ "New Zealand People's Party",
      {{ column }} == "Nmp" ~ "NMP",
      {{ column }} %in% c("Progressive Coalition", "Jim Anderton s Progressive",
                          "Jim Anderton s Progressive Coalition") ~ "Jim Anderton's Progressive",
      {{ column }} == "ONE Party" ~ "OneNZ Party",
      {{ column }} == "Outdoor Rec  Nz" ~ "Outdoor Rec NZ",
      {{ column }} == "Others" ~ "Other",
      {{ column }} == "RAM   Residents Action Movement" ~ "RAM - Residents Action Movement",
      {{ column }} == "The Bill And Ben Party" ~ "The Bill and Ben Party",
      {{ column }} == "Republican" ~ "Republican Party",
      {{ column }} %in% c("The Opportunities Party  TOP", "TOP") ~ "The Opportunities Party (TOP)",
      {{ column }} %in% c("The Republic of New Zealand Party","The Republic Of New Zealand Part") ~ "Republic of New Zealand Party",
      {{ column }} == "Workers Party of New Zealand" ~ "Workers Party",
      {{ column }} == "Women s Rights Party" ~ "Women's Rights Party",
      {{ column }} %in% c("United Future New Zealand", "United NZ", "United New Zealand Party",
                          "United New Zealand") ~ "United Future",
      .default = {{ column }}
    ))
}

# Function to remove NaNs from a data frame
is.nan.df <- function(x) {
  do.call(cbind, lapply(x, is.nan))
}

# Function to save data to .rds file
save_to_rds <- function(data_name) {
  sysdata_filenames <- load("R/sysdata.rda")
  save(list = c(sysdata_filenames, data_name), file = "R/sysdata.rda")
}

