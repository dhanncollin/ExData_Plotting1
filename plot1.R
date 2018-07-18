# Reads the data in "household_power_consumption.txt"
      maindata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';',
                           na.strings = "?", nrows = 2075259, check.names = FALSE,
                           stringsAsFactors = FALSE, comment.char = "", quote = '\"')

# Trims the data
      trimdata <- subset(maindata, Date %in% c("1/2/2007","2/2/2007"))

# Change the date format
      trimdata$Date <- as.Date(trimdata$Date, format="%d/%m/%y")

# Create a histogram and saving it as png file
      png("plot1.png", width = 480, height = 480)
      hist(trimdata$Global_active_power, main = "Global Active Power",
            xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
      
# Close the PNG device     
      dev.off()