NEI <- readRDS("summarySCC_PM25.rds")
baltimoreNEI <- NEI[NEI$fips == "24510", ]
baltimoreType <- aggregate(Emissions ~ year + type, baltimoreNEI, sum)
png("plot3.png", width = 640, height = 480)
g <- ggplot(baltimoreType, aes(factor(year), Emissions, group = type, color = type))
g + geom_line(size = 1) + geom_point(size = 3) +
  # Set color to "green" for all categories
  scale_color_manual(values = c("point"="#006400", "nonpoint"="#3CB371", "onroad"="#228B22", "nonroad"="#98FB98")) +
  labs(title = "PM2.5 Emissions Trend in Baltimore City by Source Type",
       x = "Year", y = "Total PM2.5 Emissions (Tons)",
       color = "Source Type") +
  theme_minimal() + # Use a clean theme
  theme(legend.position = "bottom")
dev.off()
