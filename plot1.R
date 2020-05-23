# Read the data
file <- "household_power_consumption.txt"
data_full <- read.table(file, header = TRUE, sep = ";", na.strings = "?")

# Convert Date column into Date class objects
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

# Subset data for dates Feb 1, 2007 to Feb 2, 2007
data <- subset(data_full, Date == "2007-02-01" | Date == "2007-02-02")

# Make Plot 1 (histogram) 
with(data, hist(Global_active_power, main = "Global Active Power", 
        xlab = "Global Active Power (kilowatts)", col = "red"))

# Copy to PNG Graphics Device
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()