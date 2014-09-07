powerdata= read.table("household_power_consumption.txt",sep=";",header=T, dec=".",na.strings=c('?'));
powerdata= transform(powerdata,Date=strptime(as.character(Date), "%d/%m/%Y"));
subsetdata= subset(powerdata,as.numeric(format(Date,"%Y"))==2007 & as.numeric(format(Date,"%m"))==2 & (as.numeric(format(Date,"%d"))==1 | as.numeric(format(Date,"%d"))==2))
png(filename="./Plot1.png",width = 480,height = 480);
hist(subsetdata$Global_active_power,col="red",xlab = "Global Active Power(kilowatts)",main="Global Active Power",plot=TRUE);
dev.off();

