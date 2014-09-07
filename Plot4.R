powerdata= read.table("household_power_consumption.txt",sep=";",header=T, dec=".",na.strings=c('?'));
powerdata= transform(powerdata,Date=strptime(as.character(Date), "%d/%m/%Y"));
subsetdata= subset(powerdata,as.numeric(format(Date,"%Y"))==2007 & as.numeric(format(Date,"%m"))==2 & (as.numeric(format(Date,"%d"))==1 | as.numeric(format
                                                                                                                                                     (Date,"%d"))==2));
subsetdatatime= transform(subsetdata,Time=strptime(Time, format="%H:%M:%OS"));


png(filename="./Plot4.png",width = 480,height = 480);

par(mfrow=c(2,2))


#plot 1:
plot(subsetdatatime$Time,subsetdatatime$Global_active_power,ylab = "Global Active Power(kilowatts)",type="l",xlab="");

#plot 2:
plot(subsetdatatime$Time,subsetdatatime$Voltage,type="l",xlab="datetime",ylab="Voltage");

#plot3:
plot(subsetdatatime$Time,subsetdatatime$Sub_metering_1,type="n",ylab = "Energy Sub metering",xlab="");
lines(subsetdatatime$Time,subsetdatatime$Sub_metering_1);
lines(subsetdatatime$Time,subsetdatatime$Sub_metering_2,col="red");
lines(subsetdatatime$Time,subsetdatatime$Sub_metering_3,col="blue");
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75,bty="n",y.intersp = 0.6,xjust=1,yjust = 1);


#plot 4: 
plot(subsetdatatime$Time,subsetdatatime$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power");
dev.off(); 