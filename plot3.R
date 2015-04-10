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
##unify date and time and convert to POSIXct
date_time <-as.POSIXct(paste(graph_data$z, graph_data$Time))  
##open png file       
png( file = "plot3.png", width = 480, height =480)                

##create empty plot with axis labels.  Then add three plots using the lines function
##for each sub metering set of data as line graphs

plot(date_time, sub1, type ="n", ylab = "Energy sub metering", xlab ="") 
lines(date_time, sub1, type ="l")                                        
lines(date_time,sub2, type ="l", col = "red")                            
lines(date_time,sub3, type ="l", col = "blue")                           
##add a a legend to the graph
legend("topright", lty = 1 , col = c("black","red", "blue"),
 legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

##close png file
dev.off()  