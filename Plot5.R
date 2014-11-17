NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

index<-grepl("mobile.*vehicles",SCC$EI.Sector,ignore.case=T)
Sdata<-SCC[index,]
NEI<-NEI[NEI$fips=="24510",]
finaldata<-NEI[NEI$SCC %in% Sdata$SCC,]
aggdata<-with(finaldata,aggregate(Emissions,by=list(year),FUN=sum))
names(aggdata)<-c("Year","Emission")
png(filename="plot5.png",width=480,height=480)
qplot(x=Year,y=Emission,data=aggdata,geom=c("point","smooth"),method="loess",main = "Total Coal Emissions in the United States from 1999 to 2008",ylab ="Total Emission(Tons)")
dev.off()
