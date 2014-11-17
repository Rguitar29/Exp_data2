library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")

aggdata<-with(NEI[NEI$fips=="24510",4:6],aggregate(Emissions,by=list(type,year),FUN=sum))
names(aggdata)<-c("Type","Year","Emission")
aggdata$Type=factor(aggdata$Type)
png(filename="plot3.png",width=480,height=480)
qplot(x=Year,y=Emission,data=aggdata,geom=c("point","smooth"),method="loess",color=Type,main = "Total Emissions in Baltimore city from 1999 to 2008",ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()
