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
      dev.copy(png, file ="plot2.png", width = 480, height = 480)
      with(trimdata, {
          plot(Global_active_power~Datetime, type="l",
                ylab = "Global Active Power (kilowatts)", xlab = "")
      })

# Close the PNG device   
      dev.off()