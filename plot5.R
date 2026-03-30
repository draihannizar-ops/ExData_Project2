NEI <- readRDS("summarySCC_PM25.rds")
vehicleNEI <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
vehicleTotal <- aggregate(Emissions ~ year, vehicleNEI, sum)
png("plot5.png", width=480, height=480)
plot(vehicleTotal$year, vehicleTotal$Emissions, type = "b", 
     pch = 20, col = "#228B22", lwd = 2,
     xlab = "Year", ylab = "PM2.5 Emissions (Tons)",
     main = "Motor Vehicle Emissions Trend in Baltimore City")
dev.off()