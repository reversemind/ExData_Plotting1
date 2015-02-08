#########################################################
#
#
loadData <- function(){
  
  message("Path of project: ", getwd())
  dataSetDirectory <- "data"

  # Check for data set directory 
  if(!file.exists(file.path(getwd(), dataSetDirectory))){
    message("Directory \"", dataSetDirectory, "\" is not exists - just create it!")
    dir.create(file.path(getwd(), dataSetDirectory))
  }else{
    message("Directory \"", dataSetDirectory, "\" already exists!")
  }
   
  #dataSetDirectory <- "./data"
  fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  fileNameZip <- "exdata-data-household_power_consumption.zip"
  fileDataSet <- "household_power_consumption.txt"
  
  # check if the file was loaded
  if(!file.exists(file.path(getwd(),dataSetDirectory, fileNameZip))) {    
    download.file(fileUrl, destfile = file.path(getwd(), dataSetDirectory, fileNameZip), method = "auto")
    fileDataSet <- unzip(file.path(dataSetDirectory, fileNameZip), overwrite = TRUE)    
  }
  
  message("Loading data ...")
  # Extract a specific part of data
  allData <- read.table(fileDataSet, header=T, sep=";")
  
  message("Processign data ...")
  # We will only be using data from the dates 2007-02-01 and 2007-02-02. 
  # One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
  data <- allData[(allData$Date=="1/2/2007") | (allData$Date=="2/2/2007"),]
  
  # make values as numeric not a string
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
  data$Voltage <- as.numeric(as.character(data$Voltage))
  
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  
  
  # Transform Date, Time into the additional single Value
  data <- transform(data, timestamp=as.POSIXct(strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S")))
  
  data
  
}



