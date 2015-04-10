##read file 
data <-read.table("./household_power_consumption.txt", sep = ";", colClasses = "character", na.strings ="?", header = TRUE)   
y <- data$Date   ##create vector with Date column
##convert to date class
z <- as.Date(y, "%d/%m/%Y") 
##combine data class vector with data
date_data <- cbind(z, data)   
##create new dataframe with only the selected dates
graph_data <- subset(date_data, z =="2007-02-01" | z== "2007-02-02")  
##convert global active power to numeric
yaxis<- as.numeric(graph_data$Global_active_power)  
##convert date and time to POSIXct class
date_time <-as.POSIXct(paste(graph_data$z, graph_data$Time))  
##open png file
png( file = "plot2.png", width = 480, height =480)  
##plot date versus global active power as a line graph
plot(date_time, yaxis, type = "l", xlab="", ylab ="Global Active Power (kilowatts)")  
##close png file
dev.off()  