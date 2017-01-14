NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# aggregate Emissions and year column
agg <- aggregate(Emissions~year, NEI, sum)

png('plot1.png')
plot(agg$year, agg$Emissions,type = 'b',  
     xlab="Year",
     ylab='PM2.5 Emissions (tons)',
     main='Total PM2.5 Emissions in U.S.A.')
dev.off()