## Plot4.R
## This plots 4 charts for 2 reference days. The output is generated as a png file - Plot4.png

makePlot4 <- function ()
{
  ## Set the working directory 
  setwd("C:/Users/E1-21804G50MNK/Dropbox/Gaurav C/Career Move 2015/Courses/Exploratoty Data Analysis")
  
  ## find the starting position of the desired date 
  dpos <- grep("1/2/2007",readLines("household_power_consumption.txt"))
  
  ## read the records. The required range of 2 days will have 2880 records 
  ds <- read.table("household_power_consumption.txt" , skip= dpos[1]-1,nrows=2880, sep=";", na.strings = "?")
  
  ## name the columns
  cNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  colnames(ds) <- cNames
  
  ## reformat date and time 
  ds$Date <- as.Date(ds$Date , format="%d/%m/%Y")
  ds <- transform(ds,timest = strptime(paste(Date, Time),"%Y-%m-%d %H:%M:%S"))
  
  par (mfcol=c(2,2))
  
  ## Generate the plot (1,1)
  plot ( ds$timest,ds$Global_active_power,type = "n", ylab = "Global Active Power", xlab ="")
  lines (ds$timest,ds$Global_active_power,type = "l")
  
  ## Generate the plot (2,1)
  plot(ds$timest, ds$Sub_metering_1, type="l", xlab= "", ylab="Energy Sub_Metering")
  lines (ds$timest,ds$Sub_metering_2,type = "l", col = "red")
  lines (ds$timest,ds$Sub_metering_3,type = "l", col = "blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1), col=c("black","red", "blue"), cex=0.5) 
  
  
  ## Generate the plot (1,2)
  plot (ds$timest,ds$Voltage,type = "l", ylab = "Voltage", xlab ="datetime")
 
    
  ## Generate the plot (2,2)
  plot (ds$timest,ds$Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab ="datetime")
    
  
  ## Copy the plot to Plot4.png
  dev.copy(png, file = "Plot4.png")
  dev.off()
}