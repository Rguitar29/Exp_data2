NEI <- readRDS("summarySCC_PM25.rds")

aggdata<-with(NEI[NEI$fips=="24510",],aggregate(Emissions,by=list(year),FUN=sum))
names(aggdata)<-c("Year","Emission")
png(filename="plot2.png",width=480,height=480)
with(aggdata,plot(Year,Emission,"o",main = "Total Emissions in Baltimore city from 1999 to 2008",ylab = expression('Total PM'[2.5]*" Emission")))
dev.off()
