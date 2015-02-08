##########################################################
#
# Plot #4 - all plots
#
plot4 <- function(){
  message("Creating plot4.png file...\n")
  source("./loadData.R")
  
  data <- loadData()
  
  # PNG size
  WIDTH  <- 480
  HEIGHT <- 480
  
  par(mfrow=c(2,2))
  
  with(data, {
    
    # plot 1
    plot(timestamp, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    
    # plot 2
    plot(timestamp, Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    # plot 3
    plot(timestamp,  Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
    lines(timestamp, Sub_metering_2, col="red")
    lines(timestamp, Sub_metering_3, col="blue")
    legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), bty="n", cex=.5) 
        
    # plot 4
    plot(timestamp, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")    
  })
  
  dev.copy(png, file="plot4.png", width=WIDTH, height=HEIGHT)
  dev.off()
  
  message("DONE \n")
}

plot4()
