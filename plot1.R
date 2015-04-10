##Read Household power consumption dataset and save to data.frame called data
data <-read.table("./household_power_consumption.txt", sep = ";", 
                  colClasses = "character", na.strings ="?", header = TRUE) 

##create a new vector with the Date column from data
y <- data$Date                   
##convert y to Data formate and save in z
z <- as.Date(y, "%d/%m/%Y")    
##combine the new Date info with data
date_data <- cbind(z, data)  
##create a new data.frame with only data from the selected dates
graph_data <- subset(date_data, z =="2007-02-01" | z== "2007-02-02")
##create a new vector converting global_active_power from char to numeric
plot1<- as.numeric(graph_data$Global_active_power)    
##create a new png file called "plot1.png"
png( file = "plot1.png", width = 480, height =480)  
##plot the global active power info on the xaxis as a histogram
hist(plot1, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" )  
##close the file
dev.off()  