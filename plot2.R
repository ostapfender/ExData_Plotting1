ds <- read.table("household_power_consumption.txt", sep = ';', header = TRUE)
plots_ds <- ds[ds$Date == "1/2/2007" | ds$Date == "2/2/2007", ]
png("plot2.png")
plots_ds <- transform(plots_ds, datetime = strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
with(plots_ds, plot(datetime, as.numeric(as.character(Global_active_power)), type = "n", xlab = '', 
ylab = "Global Active Power (kilowatts)"))
with(plots_ds, lines(datetime, as.numeric(as.character(Global_active_power))))
dev.off()