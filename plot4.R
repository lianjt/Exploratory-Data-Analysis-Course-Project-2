NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get all Coal related rows
sccsub <- SCC[grep("Coal", SCC$Short.Name),]

# match with rows in NEI
neisub <- NEI[NEI$SCC %in% sccsub$SCC,]

# aggrerate
agg <- aggregate(Emissions ~ year, neisub, sum)

png('plot4.png')
plot(agg$year, agg$Emissions,type = 'b',  
     xlab="Year",
     ylab='PM2.5 Emissions (tons)',
     main='Total Emissions from coal sources from 1999 to 2008')
dev.off()