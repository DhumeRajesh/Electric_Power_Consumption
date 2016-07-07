
##Load the file
setwd("E:/edX/Courseera/Exploratory_Data_Analysis/Assignment 1")
electricity <- read.table("household_power_consumption.txt",header=T,sep=";",comment.char = "%",stringsAsFactors = FALSE,na.strings = "?")

electricity$Date <- as.Date(electricity$Date,format = "%d/%m/%Y")
df<- electricity[(electricity$Date=="2007-02-01")|(electricity$Date=="2007-02-02"),]

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df<-transform(df,timestamp(as.POSIXct(paste(Date,Time)),"%d/%m,%Y %H:%M:%S"))

##Plot 1
hist(df$Global_active_power,main=paste("Global Active Power"),col="red",xlab = "Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png",width=480,height=480)

dev.of

##Plot 2
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png has been saved in", getwd())

##Plot 3
plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png has been saved in", getwd())

##Plot 4
par(mfrow=c(2,2))
##PLOT 4.1
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##PLOT 4.2
plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

##PLOT 4.3
plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

#PLOT 4.4
plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#OUTPUT
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png has been saved in", getwd())
