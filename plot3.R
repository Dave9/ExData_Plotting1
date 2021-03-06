plot3 <- function() {
    # Course Project Assignment #1 for Exploratory Data Analysis
    # Plot #3 - multiple line graph of Sub_metering variables
    #
    # Using the Individual household electric power consumption Data Set and
    # base plotting system, create plot3.R which produces plot3.png 
    #
    #Download and unzip this source data File:
    fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    #Save it to "household_power_consumption.txt"
    
    #Load source file into data.frame, convert the Date and Time variables to R Date/Time
    #class and then subset required rows from February 1-2, 2007
    df <- read.csv("household_power_consumption.txt", sep=';', na.strings = "?")
    c <- cbind(DateTime = strptime(paste(df[,1], df[,2]), format = "%d/%m/%Y %H:%M:%S"), df[,3:9])
    hpc <- c[c$DateTime >= "2007-02-01 00:00:00" & c$DateTime < "2007-02-03 00:00:00" & !is.na(c$DateTime), ]
    rm(df); rm(c) # clean up temp variables

    plot(hpc$DateTime, hpc$Sub_metering_1, type="l", col = "black", xlab = "", ylab = "")
    lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col = "red")
    lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col = "blue")
    title(ylab = "Energy sub metering")
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
                                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    # For png and many devices, the default width = 480, height = 480
    dev.copy(png, file = "plot3.png")
    dev.off()
}
