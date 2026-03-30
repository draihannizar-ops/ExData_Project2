NEI <- readRDS("summarySCC_PM25.rds")
baltimoreNEI <- NEI[NEI$fips == "24510", ]
baltimoreTotal <- aggregate(Emissions ~ year, baltimoreNEI, sum)
barplot(
  baltimoreTotal$Emissions, 
  names.arg = baltimoreTotal$year, 
  xlab = "Year", 
  ylab = "Total PM2.5 Emissions (Tons)",
  main = "Total PM2.5 Emissions in Baltimore City, Maryland",
  col = "orange"
)
dev.off()