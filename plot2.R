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


#draw plot2
png("plot2.png")
plot(datetime,dt$Global_active_power,xlab="",ylab = "Global Active Power (kilowatts)",main="",type="l")
dev.off()


