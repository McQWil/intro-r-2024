library(readxl)
library(dplyr)

df<- read_excel("data/icebreaker_answers.xlsx")
head(df)

df
tail(df)

df<- df|> bind_rows(slice_tail(df))
df<- df|> bind_rows(slice_tail(df,n=3)) #add more than just the last row
tail(df)

df<-df|> distinct() #returns only 1 unique row per set of values, same as unique in base r
df 

bb<- df |> select(travel_mode, travel_distance, travel_time) #grabs all columns except the serial comma
bb

df |> select(-serial_comma)  # another way, use the minus if you want to drop columns

df |> select(travel_mode:travel_distance)  #a group of columns from start to end

df |> select(starts_with("travel_")) #selecting columns by expression or string

df_travel<- df|> select(-serial_comma)


#mutate and rename (creating and modifying dataframes)

#add heading levels by 4 dashes ----

df_travel$travel_speed <- df_travel$travel_distance / df_travel$travel_time * 60 #mph
#mutate to add calucated columns but not to rename
df_travel<-df_travel|>
  mutate(travel_speed = travel_distance / travel_time *60,
         travel_speed = travel_distance *60)

summary(df_travel)
#next level ====

#to rename
df_travel<- df_travel |> 
  rename(travel_mph = travel_speed)
colnames(df_travel)
df_travel

#if/else and case when logic ----
#adding logic to mutate

df_travel <- df_travel|>
  mutate(long_trip = if_else(travel_distance>20, 1,0))  #set values by condition

df_travel

#case when, be careful of order- most specific to least specific

df_travel<- df_travel |> 
  mutate(slow_trip = 
           case_when(
             travel_mode == "bike" & travel_mph < 12 ~ 1,
             travel_mode == "car" & travel_mph < 25 ~1,
             travel_mode == "bus" & travel_mph < 15 ~1,
             travel_mode == "light rail" & travel_mph < 20 ~1,
             .default = 0 #all else will be false or na, for example if there was one streetcar it would be flase or na
           ))

df_travel

#arrange to order output
df_travel |> arrange(travel_mph) |> print(n=25) #fromslowest to fastest
df_travel |> arrange(travel_mph, travel_mph) |> print(n=25) #fromslowest to fastest
df_travel |> arrange(desc(travel_mph)) |> print(n=25) #from fastest to slowest

boxplot(df_travel$travel_mph ~df_travel$long_trip)


df_travel 








