HP_full <- read.csv("/Users/Yvette/Desktop/Coursera/Data/household_power_consumption.txt", 
                    header = TRUE, sep = ';', na.strings = "?", nrows = 2075259, check.names = FALSE, 
                    stringsAsFactors = FALSE, comment.char = "", quote = '\"')

#subset the data
dta <- HP_full[HP_full$Date %in% c("1/2/2007", "2/2/2007"), ]
time <- strptime(paste(dta$Date, dta$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
Dta <- cbind(time, dta)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(Dta, {
  plot(Global_active_power ~ time, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ time, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ time, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ time, col = 'Red')
  lines(Sub_metering_3 ~ time, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ time, type = "l", ylab = "Global_rective_power", xlab = "datetime")
})
