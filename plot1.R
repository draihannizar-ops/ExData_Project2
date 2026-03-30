NEI <- readRDS("summarySCC_PM25.rds")
totalEmissions <- aggregate(Emissions ~ year, NEI, sum)
png("plot1.png", width=480, height=480)
barplot(
  (totalEmissions$Emissions)/10^6, 
  names.arg = totalEmissions$year, 
  xlab = "Year", 
  ylab = "Total PM2.5 Emissions (10^6 Tons)",
  main = "Total PM2.5 Emissions in the United States",
  col = "skyblue"
)
dev.off()