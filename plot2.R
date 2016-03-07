plot2 <- function() {
    # Course Project Assignment #1 for Exploratory Data Analysis
    # Plot #2 - line plot of Global Active Power over time
    #
    # Using the Individual household electric power consumption Data Set and
    # base plotting system, create plot2.R which produces plot2.png 
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

    plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab = "", ylab = "")
    title(ylab = "Global Active Power (kilowatts)")
    
    #Alternate add lines separately
    #plot(hpc$DateTime, hpc$Global_active_power, type="n", xlab = "", ylab = "")
    #lines(hpc$DateTime, hpc$Global_active_power, type="l")
    
    # For png and many devices, the default width = 480, height = 480
    dev.copy(png, file = "plot2.png")
    dev.off()
}
