NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get Baltimore data out
Baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")

#group by type and year
agg <- aggregate(Emissions ~ year, Baltimore, sum)

png('plot5.png')
plot(agg$year, agg$Emissions, type = "b", xlab = "year", ylab = "Emissions", main = "motor vehicle sources changed from 1999–2008 in Baltimore City")
dev.off()