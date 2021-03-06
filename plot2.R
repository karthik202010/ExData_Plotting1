#Read household_power_consumption.txt data from the working directory
house_pow_cons <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";")
#Convert the Date column to Date format
house_pow_cons$Date <- as.Date(strptime(house_pow_cons$Date,"%d/%m/%Y"))
#Subset for 1st and 2nd Feb 2007
house_pow_consum_Subset <- subset(house_pow_cons,Date == "2007-02-01" | Date == "2007-02-02")
#Check summary to see the details of Data
summary(house_pow_consum_Subset)
str(house_pow_consum_Subset)
# Replace "?" with "" and convert to number for all numeric fields
house_pow_consum_Subset$Global_active_power <- gsub("?","",house_pow_consum_Subset$Global_active_power)
house_pow_consum_Subset$Global_active_power <- as.numeric(house_pow_consum_Subset$Global_active_power)

house_pow_consum_Subset$Global_reactive_power <- gsub("?","",house_pow_consum_Subset$Global_reactive_power)
house_pow_consum_Subset$Global_reactive_power <- as.numeric(house_pow_consum_Subset$Global_reactive_power)

house_pow_consum_Subset$Voltage <- gsub("?","",house_pow_consum_Subset$Voltage)
house_pow_consum_Subset$Voltage <- as.numeric(house_pow_consum_Subset$Voltage)

house_pow_consum_Subset$Global_intensity <- gsub("?","",house_pow_consum_Subset$Global_intensity)
house_pow_consum_Subset$Global_intensity <- as.numeric(house_pow_consum_Subset$Global_intensity)

house_pow_consum_Subset$Sub_metering_1 <- gsub("?","",house_pow_consum_Subset$Sub_metering_1)
house_pow_consum_Subset$Sub_metering_1 <- as.numeric(house_pow_consum_Subset$Sub_metering_1)

house_pow_consum_Subset$Sub_metering_2 <- gsub("?","",house_pow_consum_Subset$Sub_metering_2)
house_pow_consum_Subset$Sub_metering_2 <- as.numeric(house_pow_consum_Subset$Sub_metering_2)

house_pow_consum_Subset$Sub_metering_3 <- gsub("?","",house_pow_consum_Subset$Sub_metering_3)
house_pow_consum_Subset$Sub_metering_3 <- as.numeric(house_pow_consum_Subset$Sub_metering_3)

#Convert Date to Week_day
# house_pow_consum_Subset$Week_day <- format(house_pow_consum_Subset$Date,"%a")
library(lubridate)
# house_pow_consum_Subset$DateTime <- as.Date(paste0(house_pow_consum_Subset$Date," ",house_pow_consum_Subset$Time),"%Y-%m-%d %H:%M:%S")
house_pow_consum_Subset$DateTime <- with(house_pow_consum_Subset, ymd(Date) + hms(Time))



# Plot2
png("plot2.png", width = 480, height = 480)
plot(house_pow_consum_Subset$DateTime,house_pow_consum_Subset$Global_active_power, xlab = "",ylab = "Global Active Power (Kilowatts)", type = "l")
dev.off() 
