NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

index<-grepl("Fuel Comb.*coal",SCC$EI.Sector,ignore.case=T)
Sdata<-SCC[index,]
finaldata<-NEI[NEI$SCC %in% Sdata$SCC,]
aggdata<-with(finaldata,aggregate(Emissions,by=list(year),FUN=sum))
names(aggdata)<-c("Year","Emission")
png(filename="plot4.png",width=480,height=480)
qplot(x=Year,y=Emission,data=aggdata,geom=c("point","smooth"),method="loess",main = "Total Coal Emissions in the United States from 1999 to 2008",ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()
