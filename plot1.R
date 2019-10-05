ds <- read.table("household_power_consumption.txt", sep = ';', header = TRUE)
plots_ds <- ds[ds$Date == "1/2/2007" | ds$Date == "2/2/2007", ]
png("plot1.png")
hist(as.numeric(as.character(plots_ds$Global_active_power)), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()