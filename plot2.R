HP_full <- read.csv("/Users/Yvette/Desktop/Coursera/Data/household_power_consumption.txt", 
                    header = TRUE, sep = ';', na.strings = "?", nrows = 2075259, check.names = FALSE, 
                    stringsAsFactors = FALSE, comment.char = "", quote = '\"')

#subset the data
dta <- HP_full[HP_full$Date %in% c("1/2/2007", "2/2/2007"), ]
time <- strptime(paste(dta$Date, dta$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
Dta <- cbind(time, dta)

#second plot
plot(Dta$time, Dta$Global_active_power, type = "l", col = "black", ylab = "Global Active Power (kilowatts)", xlab = "")