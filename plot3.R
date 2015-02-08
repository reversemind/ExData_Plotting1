##########################################################
#
# Plot #3 - Energy sub metering
#
plot3 <- function(){
  message("Creating plot3.png file...\n")
  source("./loadData.R")
  
  data <- loadData()
  
  # PNG size
  WIDTH  <- 480
  HEIGHT <- 480
  
  with(data, {
    plot(timestamp, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
    
    lines(timestamp, Sub_metering_2, col="red")
    lines(timestamp, Sub_metering_3, col="blue")
    
    legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1))    
  })
  
  dev.copy(png, file="plot3.png", width=WIDTH, height=HEIGHT)
  dev.off()
  
  message("DONE \n")
}

plot3()

