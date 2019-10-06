ds <- read.table("household_power_consumption.txt", sep = ';', header = TRUE)
plots_ds <- ds[ds$Date == "1/2/2007" | ds$Date == "2/2/2007", ]
png("plot4.png")
plots_ds <- transform(plots_ds, datetime = strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
par(mfrow = c(2, 2))
# 1
with(plots_ds, plot(datetime, as.numeric(as.character(Global_active_power)), type = "n", xlab = '', ylab = "Global Active Power"))
with(plots_ds, lines(datetime, as.numeric(as.character(Global_active_power))))
# 2
with(plots_ds, plot(datetime, as.numeric(as.character(Voltage)), type = "n", xlab = 'datetime', ylab = "Voltage"))
with(plots_ds, lines(datetime, as.numeric(as.character(Voltage))))
# 3
with(plots_ds, plot(datetime, as.numeric(as.character(Sub_metering_1)), type = "n", xlab = '', ylab = "Energy sub metering"))
with(plots_ds, lines(datetime, as.numeric(as.character(Sub_metering_1))))
with(plots_ds, lines(datetime, as.numeric(as.character(Sub_metering_2)), col = "red"))
with(plots_ds, lines(datetime, as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, bty = "n")
# 4 
with(plots_ds, plot(datetime, as.numeric(as.character(Global_reactive_power)), type = "n", xlab = 'datetime', ylab = "Global_reactive_power"))
with(plots_ds, lines(datetime, as.numeric(as.character(Global_reactive_power))))
dev.off()