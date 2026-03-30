NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coalMatches <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
combMatches <- grepl("comb", SCC$Short.Name, ignore.case=TRUE)
coalCombSCC <- SCC[coalMatches & combMatches, ]$SCC
coalNEI <- NEI[NEI$SCC %in% coalCombSCC, ]
coalTotal <- aggregate(Emissions ~ year, coalNEI, sum)
png("plot4.png", width = 480, height = 480)
barplot(
  (coalTotal$Emissions)/10^5, 
  names.arg = coalTotal$year, 
  xlab = "Year", 
  ylab = "PM2.5 Emissions (10^5 Tons)",
  main = "Total PM2.5 Emissions from Coal Combustion (US)",
  col = "#228B22", # Forest Green
  border = "black"
)
dev.off()
