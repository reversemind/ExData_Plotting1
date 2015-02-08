##########################################################
#
# Plot 'Global Active Power'
#
plot1 <- function(){
  message("Creating plot1.png file...\n")
  source("./loadData.R")

  data <- loadData()
  
  # PNG size
  WIDTH  <- 480
  HEIGHT <- 480
  
  hist(data$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot1.png", width=WIDTH, height=HEIGHT)  
  dev.off() 
  
  message("DONE \n")
}
plot1()