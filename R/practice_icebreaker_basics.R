#### Practice Problem: Loading and manipulating a data frame ####
# Don't forget: Comment anywhere the code isn't obvious to you!

# Load the readxl and dplyr packages

# Use the read_excel function to load the class survey data

# Take a peek!
aa<-read_excel("data/icebreaker_answers.xlsx")

# Create a travel_speed column in your data frame using vector operations and 
#   assignment
aa$travel_speed<- aa$travel_distance/aa$travel_time *60

# Look at a summary of the new variable--seem reasonable?
summary(aa)

# Choose a travel mode, and use a pipe to filter the data by your travel mode
bb<- aa|>
  filter(travel_mode == "car")

cc<- aa|> 
  filter(travel_mode =="bus")

# Note the frequency of the mode (# of rows returned)
nrow(bb)
nrow(aa)

# Repeat the above, but this time assign the result to a new data frame
dd<- as.data.frame(bb)
str(dd)

# Look at a summary of the speed variable for just your travel mode--seem 
#   reasonable?
summary(dd$travel_speed)
hist(aa$travel_speed)
boxplot(aa$travel_speed ~ aa$travel_mode)

# Filter the data by some arbitrary time, distance, or speed threshold

ee<-dd|>
  filter(travel_time>20 & travel_distance>20)  #or |> filter(travel_mode == "light rail")

# Stretch yourself: Repeat the above, but this time filter the data by two 
#   travel modes (Hint: %in%)
gg<-as.data.frame(aa)
ff<-gg|>
  filter(travel_mode %in% c("car","bus") & travel_distance>2) # or |>filter(travel_mode == "bike" | travel_mode == "car")




