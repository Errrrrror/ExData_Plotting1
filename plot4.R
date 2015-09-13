#assume the data file had been unziped and placed in the working directory

#need package("data.table")
install.packages("data.table")
library(data.table)

#read the data

filename<-"household_power_consumption.txt"
tmp<-fread(filename,sep=";",na.strings = "?",header = TRUE)

#preprocess the data
temp<-tmp[tmp$Date=="1/2/2007" | tmp$Date=="2/2/2007"]
dt<-temp
i<-3
while (i<10){dt[[i]]<-as.numeric(temp[[i]]);i<-i+1}
datetime<-strptime(paste(dt$Date,dt$Time),"%d/%m/%Y %H:%M:%S")


#draw plot4
png("plot4.png")

par(mfrow=c(2,2))

#draw the plot on the topleft position
plot(datetime,dt$Global_active_power,xlab="",ylab = "Global Active Power",main="",type="l")
#draw the plot on the topright position
plot(datetime,dt$Voltage,xlab="datetime",ylab = "Voltage",main="",type="l")
#draw the plot on the bottomleft position(same as code for plot3)
plot(datetime,dt$Sub_metering_1,type = "l")
lines(datetime,dt$Sub_metering_2,col="red")
lines(datetime,dt$Sub_metering_3,col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lty=1)
#draw the plot on the topright position
plot(datetime,dt$Global_reactive_power,xlab="datetime",ylab = "Global_reactive_power",main="",type="l")


dev.off()
