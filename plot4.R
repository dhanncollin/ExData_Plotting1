# Reads the data in "household_power_consumption.txt"
      maindata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';',
                          na.strings = "?", nrows = 2075259, check.names = FALSE,
                          stringsAsFactors = FALSE, comment.char = "", quote = '\"')

# Trims the data
      trimdata <- subset(maindata, Date %in% c("1/2/2007","2/2/2007"))

# Change the date format
      trimdata$Date <- as.Date(trimdata$Date, format="%d/%m/%Y")
      datetime <- paste(as.Date(trimdata$Date), trimdata$Time)
      trimdata$Datetime <- as.POSIXct(datetime)

# Create a plot and saving it as png file
      png("plot4.png", width = 480, height = 480)
      par(mfrow = c(2,2))
      with(trimdata, {
            plot(Global_active_power~Datetime, type="l",
                ylab = "Global Active Power (kilowatts)", xlab = "")
            plot(Voltage~Datetime, type="l",
                ylab = "Voltage", xlab = "datetime")
            plot(Sub_metering_1~Datetime, type="l",
                ylab = "Energy sub metering", xlab = "")
            lines(Sub_metering_2~Datetime, col = "Red")
            lines(Sub_metering_3~Datetime, col = "Blue")
            legend("topright", col = c("black", "red", "blue"),
                  c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "), lty = c(1,1), bty = "n", cex = .75)
            plot(Global_reactive_power~Datetime, type="l",
                ylab = "Global Reactive Power (kilowatts)", xlab = "datetime")
      })

# Close the PNG device   
      dev.off()