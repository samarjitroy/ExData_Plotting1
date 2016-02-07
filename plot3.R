library(curl)
library(data.table)

p <- function(...) {
	d <- format(Sys.time(), "[%a %b %d %H:%M:%S %Y ]")
	cat(d, ...)
	flush.console()
}

done <- function() {
	cat("completed.\n")
}


date_time <- function(date, time) {
	return (strptime(paste(date, time), "%d/%m/%Y %H:%M:%S"))
}

getDataFileUnzip <- function(){
	# if current directory does not have data subdir, create one
      p("if current directory does not have data subdir, create one...")
	mainDir <- getwd()
	if (!file.exists("data")){
		dir.create(file.path(mainDir, "data"))
	}
	done()

      # download zip file from the source
	p("download zip file from the source...")
	dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	downloadFileName <- "data/exdata-data-household_power_consumption.zip"
	if (!file.exists(downloadFileName))
	{
		download.file(dataURL, dest=downloadFileName, method="libcurl",quiet = TRUE)
	}
	done()

      # if zip file exists, unzip with overwrite
      p("if zip file exists, unzip with overwrite..")
	if (file.exists(downloadFileName))
	{
		unzip(downloadFileName, exdir = "data", overwrite = TRUE)
     	} 
	done()
}

loadPlotData <- function(plotDir) {
	
	# get Data from Source
      getDataFileUnzip()

	fileName <- "household_power_consumption.txt"
      p("Finding Last row number for Date '2007-02-01'  '2007-02-02'.....")
      rowsNum <- grep("^[1-2]/2/2007", readLines(file.path(plotDir, fileName)))
	loadFirst <- rowsNum[length(rowsNum)]
      done()
         
	p("Load Data into Data Frame with limited rows(",toString(loadFirst),") from the lardge file..")    	
    	plotDF <- read.table(file.path(plotDir, fileName),
                     header=TRUE,
                     sep=";",
                     nrows=loadFirst,
                     colClasses=c("character", "character", rep("numeric",7)),
                     na="?")
      done()

    	p("convert date and time variables to Date/Time class...")
    	plotDF$Time <- strptime(paste(plotDF$Date, plotDF$Time), "%d/%m/%Y %H:%M:%S")
    	plotDF$Date <- as.Date(plotDF$Date, "%d/%m/%Y")
	done()

    	p("only use data from the dates 2007-02-01 and 2007-02-02...")
    	dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    	plotDF <- subset(plotDF , Date %in% dates)
    	done()

    	return(plotDF )    
}


plot3 <- function(plotDF=NULL) {
    	p("Exploratory Data Analysis.\n")
      p("Assignment: 1.\n")
      p("Author: Samarjit Roy.\n")
	p("Plot 3: Energy sub metering.\n")
      p("\n")
    	if(is.null(plotDF))
        	plotDF  <- loadPlotData("data")
    
      p("Set Plot Device to plot3.p as 480x480...")
    	png("plot3.png", width=480, height=480)
      curPlotDevice <- dev.cur()
      done()
      
	p("Plotting line on device:",toString(curPlotDevice),"...")
    	plot(plotDF$Time, plotDF$Sub_metering_1, type="l", col="black",
         	xlab="", ylab="Energy sub metering")
    	lines(plotDF$Time, plotDF$Sub_metering_2, col="red")
    	lines(plotDF$Time, plotDF$Sub_metering_3, col="blue")
	done()
      
	p("Creating Legend...")
    	legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1)
    	done()
      
	p("Closing current device:",toString(curPlotDevice),"....")
    	dev.off()      
      done()
}
plot3()
