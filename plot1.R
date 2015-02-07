# Load data
source('scripts/load-power-data.R')

# Open png device
png(filename='plots/plot1.png')

# Make plot
hist(power.df$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# Turn off device
dev.off()