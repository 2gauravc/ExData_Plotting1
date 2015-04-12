## Plot 1.R
## This plots the hisogram of Global Active Power. The output is generated as a png file - Plot1.png

makePlot1 <- function ()
{
  ## Set teh working directory 
  setwd("C:/Users/E1-21804G50MNK/Dropbox/Gaurav C/Career Move 2015/Courses/Exploratoty Data Analysis")
  
  ## find the starting position of the desired date 
  dpos <- grep("1/2/2007",readLines("household_power_consumption.txt"))
  
  ## read the records. The required range of 2 days will have 2880 records 
  ds <- read.table("household_power_consumption.txt" , skip= dpos[1]-1,nrows=2880, sep=";", na.strings = "?")
  
  ## name the columns
  cNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  colnames(ds) <- cNames
  
  ## Generate the plot
  
  hist(ds$Global_active_power, col = "red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.copy(png, file = "Plot1.png")
           dev.off()
}