##Load the file
setwd("E:/edX/Courseera/Exploratory_Data_Analysis/Assignment 1/Plot2")
electricity <- read.table("household_power_consumption.txt",header=T,sep=";",comment.char = "%",stringsAsFactors = FALSE,na.strings = "?")

electricity$Date <- as.Date(electricity$Date,format = "%d/%m/%Y")
df <- electricity[(electricity$Date=="2007-02-01")|(electricity$Date=="2007-02-02"),]

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

##Plot 2
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png has been saved in", getwd())

