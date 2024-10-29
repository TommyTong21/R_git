## load packages
library(tidyverse)
library(sf)
library(here)
library(janitor)
library(countrycode)

## read in data
HDR <- read_csv(here::here("HDR_DATA", "HDR23-24_Composite_indices_complete_time_series.csv"),
                locale = locale(encoding = "latin1"),
                na = " ", skip=0)

World <- st_read("/Applications/lecture/CASA0005/wk4/git_clone/World_Countries_(Generalized)_2402777631520798174/World_Countries_Generalized.shp")
## creat new column
HDRcols<- HDR %>%
  clean_names()%>%
  select(iso3, country, gii_2019, gii_2010)%>%
  mutate(difference=gii_2019-gii_2010)%>%


## join world shape
  Join_HDR <- World %>% 
  clean_names() %>%
  left_join(., 
            HDRcols,
            by = c("iso" = "iso_code"))
