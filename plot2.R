#Author : Vimal Kumar M
#Date   : 07.02.2015
#File   : plot2.R
#Purpose: 1. Load the required data into R Environment
#         2. Create a PNG file name Plot1.png using X-Y Plotting, type Lines(l)

# Load data
source('load_data.R');

# Open png device
png(filename='plots/plot2.png')

# Make X-Y plot
plot(power.df$date.time, 
     power.df$Global_active_power,
     ylab='Global Active Power (kilowatts)', 
     xlab='', 
     type='l')

# Turn off device
dev.off()