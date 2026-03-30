library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
twoCities <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD", ]
cityTotal <- aggregate(Emissions ~ year + fips, twoCities, sum)
cityTotal$city <- ifelse(cityTotal$fips == "24510", "Baltimore", "Los Angeles")
png("plot6.png", width=640, height=480)
g <- ggplot(cityTotal, aes(factor(year), Emissions, fill = city))
g + geom_bar(stat="identity") + 
  facet_grid(. ~ city, scales = "free") + # "free" biar skalanya menyesuaikan tiap kota
  scale_fill_manual(values = c("Baltimore"="#3CB371", "Los Angeles"="#006400")) +
  labs(title = "Motor Vehicle Emissions: Baltimore vs. LA (1999-2008)",
       x = "Year", y = "Total PM2.5 Emissions (Tons)") +
  theme_bw()
dev.off()
