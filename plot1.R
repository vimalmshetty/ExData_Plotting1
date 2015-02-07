#Author : Vimal Kumar M
#Date   : 07.02.2015
#File   : plot1.R
#Purpose: 1. Load the required data into R Environment
#         2. Create a PNG file name Plot1.png using Histogram


# Load data
source('load_data.R');

# Open png device
png(filename='plots/plot1.png');

# Make plot
hist(power.df$Global_active_power, 
     main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', 
     col='red');

# Turn off device
dev.off();