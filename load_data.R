#Author : Vimal Kumar M
#Date   : 07.02.2015
#File   : Load_data.R
#Purpose: 1. The goal of this file is to check if the working data set exits or not
#         2. If exist load it into R
#         3. if the file doesn't exist, download the data from the web and store it into .rds form for further use
#         4. After loading the data into R, convert the date and time to the required data formats.
#         5. Finally reduce the data sets as required by the assignment - '2007-02-01' to '2007-02-02'

library(lubridate)

# If the raw data has not been saved, download, unzip, and load it.
# Save it to an .rds file for easy access later.
if (!file.exists('power-data.rds')) {
  download.file(paste0('https://d396qusza40orc.cloudfront.net/',
                       'exdata%2Fdata%2Fhousehold_power_consumption.zip'),
                destfile='raw-power-data.zip')
  unzip('raw-power-data.zip')
  
  # Read data into a table with appropriate classes
  power.df <- read.table('household_power_consumption.txt', header=TRUE,
                         sep=';', na.strings='?',
                         colClasses=c(rep('character', 2), 
                                      rep('numeric', 7)))
  
  # Convert dates and times
  power.df$Date <- dmy(power.df$Date)
  power.df$Time <- hms(power.df$Time)
  
  # Reduce data frame to what we need
  start <- ymd('2007-02-01')
  end <- ymd('2007-02-02')
  power.df <- subset(power.df, year(Date) == 2007 & 
                       month(Date) == 2 &
                       (day(Date) == 1 | day(Date) == 2))
  
  # Combine date and time
  power.df$date.time <- power.df$Date + power.df$Time
  
  # Save file
  saveRDS(power.df, file='power-data.rds')
} else {
  power.df <- readRDS('power-data.rds')
}