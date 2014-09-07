powerdata= read.table("household_power_consumption.txt",sep=";",header=T, dec=".",na.strings=c('?'));
powerdata= transform(powerdata,Date=strptime(as.character(Date), "%d/%m/%Y"));
subsetdata= subset(powerdata,as.numeric(format(Date,"%Y"))==2007 & as.numeric(format(Date,"%m"))==2 & (as.numeric(format(Date,"%d"))==1 | as.numeric(format
                                                                                                                                                     (Date,"%d"))==2));
subsetdatatime= transform(subsetdata,Time=strptime(Time, format="%H:%M:%OS"));
png(filename="./Plot3.png",width = 480,height = 480);
plot(subsetdatatime$Time,subsetdatatime$Sub_metering_1,type="n",ylab = "Energy Sub metering",xlab="");
lines(subsetdatatime$Time,subsetdatatime$Sub_metering_1);
lines(subsetdatatime$Time,subsetdatatime$Sub_metering_2,col="red");
lines(subsetdatatime$Time,subsetdatatime$Sub_metering_3,col="blue");
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"));
dev.off();