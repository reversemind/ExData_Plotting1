##########################################################
#
# Plot #2 - Global Active Power (kilowatts)
#
plot2 <- function(){
  message("Creating plot2.png file...\n")
  source("./loadData.R")
  
  data <- loadData()
  
  # PNG size
  WIDTH  <- 480
  HEIGHT <- 480
  
  with(data, plot(timestamp, Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)"))
  
  dev.copy(png, file="plot2.png", width=WIDTH, height=HEIGHT)
  dev.off()
  
  message("DONE \n")
}

plot2()
