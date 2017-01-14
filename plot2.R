NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get Baltimore data out
Baltimore <- subset(NEI, fips == "24510")
# aggregate Emissions and year column
agg <- aggregate(Emissions~year, Baltimore, sum)

png('plot2.png')
plot(agg$year, agg$Emissions,type = 'b',  
     xlab="Year",
     ylab='PM2.5 Emissions (tons)',
     main='Total PM2.5 Emissions in Baltimore')
dev.off()