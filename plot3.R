#Author : Vimal Kumar M
#Date   : 07.02.2015
#File   : plot3.R
#Purpose: 1. Load the required data into R Environment
#         2. Create a PNG file name Plot3.png using X-Y Plots, for differnt Sub_meterings

# Load data
source('load_data.R');

# Open png device
png(filename='plots/plot3.png');

# Make X-y plot
# Sub-Metering 1
plot(power.df$date.time, 
     power.df$Sub_metering_1, 
     type='l',
     xlab='', 
     ylab='Energy sub metering');

#Sub-Metering 2
lines(power.df$date.time, 
      power.df$Sub_metering_2, 
      col='red')

#Sub-Metering 3
lines(power.df$date.time, 
      power.df$Sub_metering_3, 
      col='blue')

legend('topright', 
       legend=c('Sub_metering_1', 
                'Sub_metering_2', 
                'Sub_metering_3'),
       col=c('black', 
            'red', 
            'blue'), 
       lty='solid');

# Turn off device
dev.off()

