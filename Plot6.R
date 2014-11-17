NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

index<-grepl("mobile.*vehicles",SCC$EI.Sector,ignore.case=T)
Sdata<-SCC[index,]
NEI<-NEI[NEI$fips=="24510"|NEI$fips=="06037",]
finaldata<-NEI[NEI$SCC %in% Sdata$SCC,]
data_city<-with(finaldata,aggregate(Emissions,by=list(fips,year),FUN=sum))
names(data_city)<-c("City","Year","Emission")
data_city$City<-ifelse(data_city$City=="24510","Baltimore","LA")
data_city$City=factor(data_city$City)
png(filename="plot7.png",width=480,height=480)
qplot(x=Year,y=Emission,data=data_city,color=City,geom=c("point","smooth"),method="loess",main = "Total Emissions from 1999 to 2008",ylab ="Total Emission")
dev.off(
