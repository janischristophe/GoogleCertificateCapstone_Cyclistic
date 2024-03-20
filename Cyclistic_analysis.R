### Firstly, install.packages and library packages that will allow for the data collection, organization, processing, and analysis
install.packages("tidyverse")
install.packages("rmarkdown")
install.packages("knitr")
install.packages("janitor")
install.packages("conflicted")


library(tidyverse)
library(conflicted)
conflict_prefer("filter", "dplyr")
conflict_prefer("lag", "dplyr")
library(lubridate)
library(rmarkdown)
library(knitr)
library(janitor)
library(clipr)
library(tidyr)
library(dplyr)
library(readr)
library(ggplot2)
library(skimr)
library(here)



### Next, I am wrangling the data into RStudio 
library(readr)
q1_2019 <- read_csv("~/Data Analytics Projects/Portfolio Case Studies/Case Study-Cyclistic/Divvy_Trips_2019_Q1/Cyclistic_2019_Q1.csv",
                    ended_at = col_datetime(format = "%m/%d/%Y %H:%M:%S"),
                    col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M:%S"),
                                     ended_at = col_datetime(format = "%m/%d/%Y %H:%M:%S"),
                                     ride_length = col_time(format = "%H:%M:%S"),
                                     ...15 = col_skip(), ...16 = col_skip(),
                                     ...17 = col_skip()), na = "null")
View(q1_2019)

library(readr)
q1_2020 <- read_csv("~/Data Analytics Projects/Portfolio Case Studies/Case Study-Cyclistic/Divvy_Trips_2020_Q1/Cyclistic_2020_Q1.csv",
                    col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M:%S"),
                                     ended_at = col_datetime(format = "%m/%d/%Y %H:%M:%S"),
                                     ride_length = col_time(format = "%H:%M:%S"),
                                     ...16 = col_skip(), ...17 = col_skip(),
                                     ...18 = col_skip(), ...19 = col_skip(),
                                     ...20 = col_skip()), na = "null")
View(q1_2020)


## Rename/remove attributes so that tables are able to being combined
  # While the names don't have to be in the same order, they DO need to match perfectly before we can use a command to join them into one file
colnames(q1_2019)
colnames(q1_2020)

  # Rename columns  to make them consistent with q1_2020 (as this will be the supposed going-forward with Cyclistic)
(q1_2019 <- rename(q1_2019,
                   rideable_type = bikeid,
                   started_time = started_at,
                   ended_time = ended_at,)
)
(q1_2020 <- rename(q1_2020,
                   started_time = started_at,
                   ended_time = ended_at,)
)

  # Look for incongruities
str(q1_2019)
str(q1_2020)

  # Convert ride_id and rideable_type to character so that they can stack correctly
q1_2019 <- mutate(q1_2019, trip_id = as.character(trip_id),
                  rideable_type = as.character(rideable_type))

  # Combine/stack the tables
all_trips <- bind_rows(q1_2019, q1_2020)
view(all_trips)

  # Remove lat, long, birthyear, and gender fields as this data was dropped beginning in 2020
all_trips <- all_trips %>%  
  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, gender,  "tripduration"))
view(all_trips)



##PREPARING FOR ANALYSIS
colnames(all_trips)
nrow(all_trips)
dim(all_trips)
head(all_trips)
tail(all_trips)
str(all_trips)
summary(all_trips)


view(all_trips)


## Before 2020, Divvy used different labels for these two types of riders ... we will want to make our data frame consistent with their current nomenclature
  # In the "member_casual" column, replace "Subscriber" with "member" and "Customer" with "casual"
  # I completed this in excel... but, if I had not this is how I would have completed the task:
    -# table(all_trips$usertype) --this gives the count of each user type label (in my case casual=71,643; member=720,313)
# Reassign to the desired values (we will go with the current 2020 labels)
    -# all_trips <-  all_trips %>% 
      -# mutate(member_casual = recode(member_casual,
                                    -# "Subscriber" = "member",
                                    -# "Customer" = "casual"))
    -# table(all_trips$usertype) --to double check that everything is changed properly


## Add columns that list the date, month, day, and year of each ride
  # This will allow us to aggregate ride data for each month, day, or year ... before completing these operations we could only aggregate at the ride level
all_trips$date <- as.Date(all_trips$started_time)
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")


## Add a "ride_length" calculation to all_trips --I did this in excel
  # To have "ride_length" in seconds
    -# all_trips$ride_length <- difftime(all_trips$ended_time,all_trips$started_time)
str(all_trips)
    # double checking everything is as wanted
view(all_trips)


## Remove "bad" data
  # The dataframe includes a few hundred entries when bikes were taken out of docks and checked for quality by Divvy or ride_length was negative
  # We will create a new version of the dataframe (v2) since data is being removed
all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]
view(all_trips_v2)
  # Delete rows that are "null" across the board
library(janitor)
all_trips_v2 <- all_trips_v2 %>% remove_empty("rows")
view(all_trips_v2)


## Go ahead and add the weekday and time of day
  # I did this in excel, but only have weekday number code (1[SUN]-7[SAT])
all_trips_v2$weekday_name <- format(as.Date(all_trips_v2$date), "%A")
view(all_trips_v2)

all_trips_v2$time_of_day <- lubridate::hour(all_trips_v2$started_time)
view(all_trips_v2)


### ANALYSIS TIME!
## Ride lengths 
mean(all_trips_v2$ride_length)
  # average: 831.42 seconds/0:13:51 minutes:seconds
median(all_trips_v2$ride_length)
  # median: 539.98 seconds/0:08:59 minutes:seconds
max(all_trips_v2$ride_length)
  # maximum: 86,274 seconds/23:57:54 hours:minutes:seconds
min(all_trips_v2$ride_length)
  # minimum: 1 second/0:00:01 second


## Compare member and casual users ride lengths
aggregate(all_trips_v2$ride_length ~ all_trips_v2$usertype, FUN = mean)
  # Average - Casual 2339.22sec/00:38:59; Member 689.79sec/00:11:29
aggregate(all_trips_v2$ride_length ~ all_trips_v2$usertype, FUN = median)
  # Median - Casual 1389sec/00:23:09; Member 508sec/00:08:28
aggregate(all_trips_v2$ride_length ~ all_trips_v2$usertype, FUN = max)
  # Maximum - Casual 86274sec/23:57:54; Member 85984sec/23:53:04
aggregate(all_trips_v2$ride_length ~ all_trips_v2$usertype, FUN = min)
  # Minimum - Casual 2sec; Member-1sec


## Compare member vs casual users average ride time by each day
aggregate(all_trips_v2$ride_length ~ all_trips_v2$usertype + all_trips_v2$weekday_name, FUN = mean)
# Order the weekdays as wanted
all_trips_v2$weekday_name <- ordered(all_trips_v2$weekday_name, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
  # Now they are listed Sunday-Saturday
# Re-run the average ride time comparisons 
aggregate(all_trips_v2$ride_length ~ all_trips_v2$usertype + all_trips_v2$weekday_name, FUN = mean)


## Analyze ridership data by type and weekday
all_trips_v2 %>% 
  mutate(weekday_name = wday(started_time, label = TRUE)) %>% 
  group_by(usertype, weekday_name) %>% 
  summarise(number_of_rides = n(), 
            average_duration = mean(ride_length)) %>%     #calculates average number of rides and duration
  arrange(usertype, weekday_name)	                        #sorts
    # Gives a beautiful tibble to compare user type, weekday, and average duration



### Visualize
## Number of rides by rider type
all_trips_v2 %>% 
  mutate(weekday_name = wday(started_time, label = TRUE)) %>% 
  group_by(usertype, weekday_name) %>% 
  summarise(number_of_rides = n(), 
            average_duration = mean(ride_length)) %>% 
  arrange(usertype, weekday_name)  %>% 
  ggplot(aes(x = weekday_name, y = number_of_rides, fill = usertype)) +
  geom_col(position = "dodge")


## Average duration by rider type
all_trips_v2 %>% 
  mutate(weekday_name = wday(started_time, label = TRUE)) %>% 
  group_by(usertype, weekday_name) %>% 
  summarise(number_of_rides = n(), 
            average_duration = mean(ride_length)) %>% 
  arrange(usertype, weekday_name)  %>% 
  ggplot(aes(x = weekday_name, y = average_duration, fill = usertype)) +
  geom_col(position = "dodge")



### Export data frame to .csv
write.csv(all_trips_v2, "C:/Users/Janis/OneDrive/Documents/Data Analytics Projects/Portfolio Case Studies/Case Study-Cyclistic/cleaned_analyzed_Cyclistic.csv", row.names=TRUE)

counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$usertype + all_trips_v2$weekday_name, FUN = mean)
View(counts)
write.csv(counts, "C:/Users/Janis/OneDrive/Documents/Data Analytics Projects/Portfolio Case Studies/Case Study-Cyclistic/aggregated_data_Cyclistic.csv", row.names = TRUE)