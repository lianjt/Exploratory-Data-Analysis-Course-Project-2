NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get Baltimore and Los Angeles data out
Baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")
Los <- subset(NEI, fips == "06037" & type == "ON-ROAD")

#group by type and year
aggB <- aggregate(Emissions ~ year, Baltimore, sum)
aggL <- aggregate(Emissions ~ year, Los, sum)

png('plot6.png')
# split the screen
par(mfrow = c(1,2))
plot(aggB$year, aggB$Emissions, ylim = c(0,4700), type = "b", xlab = "year", ylab = "Emissions", main = "Baltimore")
plot(aggL$year, aggL$Emissions, ylim = c(0,4700), type = "b", xlab = "year", ylab = "Emissions", main = "Los Angeles")
dev.off()