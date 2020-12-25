#Step0: Load data
#Load label data
#dt <- read.table(file = "./household_power_consumption.txt", header=TRUE, sep=';')
#dt1 <- cbind(dt, Date1 = as.Date(dt[,1],format="%d/%m/%Y"))
#dt2 <- dt1[dt1$Date1=="2007-02-01" | dt1$Date1=="2007-02-02" ,]


library(readr)
library(ggplot2)

# Read txt file;
dt <- read_csv2("./household_power_consumption.txt")

# Change Date type
Date1 <- as.Date(dt$Date, "%d/%m/%Y")
Grp <- as.numeric(dt$Global_active_power)
Sm1 <- as.numeric(dt$Sub_metering_1)
Sm2 <- as.numeric(dt$Sub_metering_2)
Sm3 <- as.numeric(dt$Sub_metering_3)
dt <- transform(dt, Date=Date1)
dt <- transform(dt, Global_active_power = Grp)
dt <- transform(dt, Sub_metering_1 = Sm1)
dt <- transform(dt, Sub_metering_2 = Sm2)
dt <- transform(dt, Sub_metering_3 = Sm3)
DateTime <- paste(dt$Date, dt$Time)
DateTime <- strptime(DateTime,"%Y-%m-%d %H:%M:%S")
dt <- cbind(dt, DateTime)

# Extract target data
dt1 <- dt[dt$Date=="2007-02-01" | dt$Date=="2007-02-02", ]

# Draw plot1.png
png(file="plot1.png")
with(dt1, hist(Global_active_power, col="red", main="Global Active Power"))
dev.off()



