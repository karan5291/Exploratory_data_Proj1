ddata = read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors=TRUE)
ddata <- ddata[ddata$Date == "1/2/2007" | ddata$Date == "2/2/2007",]
Dates <- as.Date(ddata$Date, format="%d/%m/%Y")
Times <- ddata$Time
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
data <- ddata
data$DateTime <- DateTime

png('plot3.png', width=480, height=480)
plot(data$DateTime,as.numeric(data$Sub_metering_1),type="l",xlab="",ylab="Global active power(KW)")
lines(data$DateTime,as.numeric(data$Sub_metering_2),type="l",col="RED")
lines(data$DateTime,as.numeric(data$Sub_metering_3),type="l",col="BLUE")
legend(x='topright',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,
       col=c("black", "red", "blue"))
dev.off()

