 sta_meta<-read.csv("data/portal_stations.csv", stringsAsFactors = F)

 str(sta_meta)  #structure of the data
 head(sta_meta)  #first 6 rows of data
 head(sta_meta,10) #first 10 rows of data
 tail(sta_meta) #last 6 rows of data
 nrow(sta_meta)  #number of rows
 ncol(sta_meta)  #number of columns
 summary(sta_meta)  #summary of data, can get some information about na's

  library(readxl)  #also rio is a good package
 icebreaker_answers <- read_excel("data/icebreaker_answers.xlsx")
 View(icebreaker_answers)
 
 library(dplyr)
 
 odot_meta<-sta_meta   |>  #old pipe notation  %>%
filter(agency == "ODOT", highwayid == 1)
 
 aa<-sta_meta[sta_meta$agency %in% "ODOT" & sta_meta$highwayid %in% 1,] #baseR
 
 notodot<- sta_meta |>
   filter(agency != "ODOT")
 
 nas_meta <- sta_meta |>
   filter(is.na(detectorlocation)
        )
 
 real_meta <- sta_meta |>
   filter(!is.na(detectorlocation)
   )
 
 
 
 
 

