# Read the data
file <- "household_power_consumption.txt"
data_full <- read.table(file, header = TRUE, sep = ";", na.strings = "?")

# Convert Date column into Date class objects
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

# Subset data for dates Feb 1, 2007 to Feb 2, 2007
data <- subset(data_full, Date == "2007-02-01" | Date == "2007-02-02")

# Make "datetime" variable of POSIXct class in order to graph
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# Make Plot 2 (line graph)
with(data, plot(datetime, Global_active_power, type = "l",
        xlab = "", ylab = "Global Active Power (kilowatts)"))

# Copy to PNG Graphics Device
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()