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
 
 
 
 
 
 
 