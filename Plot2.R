ddata = read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors=TRUE)
ddata <- ddata[ddata$Date == "1/2/2007" | ddata$Date == "2/2/2007",]
Dates <- as.Date(ddata$Date, format="%d/%m/%Y")
Times <- ddata$Time
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
data <- ddata
data$DateTime <- DateTime

png('plot2.png', width=480, height=480)
plot(data$DateTime,as.numeric(data$Global_active_power)/1000,type="l",xlab="",ylab="Global active power(KW)")
dev.off()
