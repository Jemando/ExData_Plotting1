##read file
data <-read.table("./household_power_consumption.txt", sep = ";", colClasses = "character", na.strings ="?", header = TRUE)  
y <- data$Date
##convert y to Date class
z <- as.Date(y, "%d/%m/%Y")  
date_data <- cbind(z, data)
##select date only from two days
graph_data <- subset(date_data, z =="2007-02-01" | z== "2007-02-02")  
##convert sub metering data from char to numeric
sub1<- as.numeric(graph_data$Sub_metering_1)   
sub2<- as.numeric(graph_data$Sub_metering_2)
sub3<- as.numeric(graph_data$Sub_metering_3)
volt <- as.numeric(graph_data$Voltage)
react <- as.numeric(graph_data$Global_reactive_power)
##unify date and time and convert to POSIXct
date_time <-as.POSIXct(paste(graph_data$z, graph_data$Time))  
yaxis<- as.numeric(graph_data$Global_active_power) 
##open png file       
png( file = "plot4.png", width = 480, height =480)                
par(mfcol = c(2, 2))
##create empty plot with axis labels.  Then add three plots using the lines function
##for each sub metering set of data as line graphs
plot(date_time, yaxis, type = "l", xlab="", ylab ="Global Active Power")  
plot(date_time, sub1, type ="n", ylab = "Energy sub metering", xlab ="") 
lines(date_time, sub1, type ="l")                                        
lines(date_time,sub2, type ="l", col = "red")                            
lines(date_time,sub3, type ="l", col = "blue")                           
##add a a legend to the graph
legend("topright", lty = 1 , col = c("black","red", "blue"), bty = "n", cex = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
plot(date_time, volt, type = "l", xlab="datetime", ylab ="Voltage") 
plot(date_time, react, type = "l", xlab="datetime", ylab ="Global_reactive_power")
##close png file
dev.off()  