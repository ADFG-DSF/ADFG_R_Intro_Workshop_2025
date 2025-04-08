# ADF&G R Intro Workshop
# Logan Wendling & Matt Tyers
# logan.wendling@alaska.gov
# matt.tyers@alaska.gov


##### SCRIPT 8 ####
##### Some more cool topics! #####


## -------- statistics -------- ##




## -------- simulation -------- ##




## -------- writing your own functions -------- ##




## -------- writing your own packages -------- ##




## -------- loops & cool syntax stuff -------- ##

# a simple loop to show how it works
for(i in 1:10) {
  print(i)
}

# - could become -
for(i in 1:10) {
  if(i != 5) {
    print(i)
  } else {
    print("Number five alive! No disassemble!")
  }
}


# opening many files at once  (this will not work!!!)
filenames <- paste0("Coho_", 2012:2025, ".csv")
filenames         # showing what was constructed

all_data <- list()  # initialize a list
for(i in seq_along(filenames)) {
  # all_data[[i]] <- read_csv(filenames[i])
}



## -------- mapping with sf, leaflet, ... -------- ##

library(tidyverse)
# this example isn't actually that interesting
waterquality <- read_csv("data/DEC_waterquality_2016.csv", skip=1) %>%
  filter(`Characteristic Name` == "Dissolved oxygen (DO)") %>%
  rename("Latitude" = "Monitoring Location Latitude") %>%
  rename("Longitude" = "Monitoring Location Longitude") %>%
  rename("DO" = "Result Value") %>%
  group_by(`Monitoring Location Name`) %>%
  summarise(mean_DO=mean(DO),
            Lat=mean(Latitude),
            Long=mean(Longitude))
# sf

# leaflet
library(leaflet)
leaflet(waterquality) %>%
  addTiles() %>%
  addMarkers(~Long, ~Lat, label=~`Monitoring Location Name`)  
  # addCircles(~Long, ~Lat, label=~`Monitoring Location Name`)  





## -------- interactive apps with Shiny -------- ##

# Start with the Shiny template!! It's a great on-ramp
# - I like structuring it as a single file
# Can deploy to the web!  Here are a few I've made:
# - https://mbtyers.shinyapps.io/Ricker1/
# - https://mbtyers.shinyapps.io/TelemetryWizard/    this one will take some practice to demo
# - https://mbtyers.shinyapps.io/chordfinder/
# - https://mbtyers.shinyapps.io/snowflake/




## -------- reproducible docs with Quarto & Markdown -------- ##

# Start with the Markdown template!! It's a great on-ramp
# - show knitting to Word
# - show echo=FALSE
# - show how to type an equation!!
# - show matching formatting to another doc?



## -------- (we should totally add something about AI tools, and any other topics you might think of) -------- ##