setwd("E:/edX/Courseera/Exploratory_Data_Analysis/Assignment 1/Plot2")
electricity <- read.table("household_power_consumption.txt",header=T,sep=";",comment.char = "%",stringsAsFactors = FALSE,na.strings = "?")

electricity$Date <- as.Date(electricity$Date,format = "%d/%m/%Y")
df <- electricity[(electricity$Date=="2007-02-01")|(electricity$Date=="2007-02-02"),]

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

##Plot 3
plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1), lwd=c(1,1))


dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png has been saved in", getwd())
