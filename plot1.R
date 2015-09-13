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

#draw plot1
png("plot1.png")
hist(dt$Global_active_power,xlab = "Global Active Power (kilowatts)",main="Global Active Power",col = "red")
dev.off()
