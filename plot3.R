library("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get Baltimore data out
Baltimore <- subset(NEI, fips == "24510")

#group by type and year
agg <- aggregate(Emissions ~ type + year, Baltimore, sum)

png('plot3.png')
g <- ggplot(agg, aes(year, Emissions, color = type)) +
    geom_line() +
    ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()