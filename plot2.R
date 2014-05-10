setwd('/Volumes/NO NAME/classes/Hopkins/ExploratoryDataAnalysis')
library(data.table)

lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
hpc <- read.table(file = "household_power_consumption.txt",
                  sep = ";",
                  skip = 66637,
                  nrows = 2880)

colnames(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')

png("plot2.png", width = 480, height = 480)

plot(hpc$datetime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

