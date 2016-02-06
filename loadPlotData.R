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

#plotDF  <- loadPlotData("data")

