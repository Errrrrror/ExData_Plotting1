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
dt[[1]]<-as.Date(temp[[1]],"%d/%m/%Y")
datetime<-strptime(paste(dt[[1]],dt[[2]]),"%Y-%m-%d %H:%M:%S")


#draw plot3
png("plot3.png")

#draw 3 series
plot(datetime,dt$Sub_metering_1,type = "l")
lines(datetime,dt$Sub_metering_2,col="red")
lines(datetime,dt$Sub_metering_3,col="blue")

#add legend
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()


