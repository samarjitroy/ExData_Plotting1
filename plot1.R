source("loadPlotData.R")

plot1 <- function(plotDF=NULL) {
    	p("Exploratory Data Analysis.\n")
      p("Assignment: 1.\n")
      p("Author: Samarjit Roy.\n")
	p("Plot 1: Global Active Power.\n")
      p("\n")
    	if(is.null(plotDF))
        	plotDF  <- loadPlotData("data")
    
      p("Set Plot Device to plot1.p as 480x480...")
    	png("plot1.png", width=480, height=480)
      curPlotDevice <- dev.cur()
      done()
      
	p("Creating Histogram on device:",toString(curPlotDevice),"...")
    	hist(plotDF$Global_active_power,
		main="Global Active Power",
         	xlab="Global Active Power (kilowatts)",
         	ylab="Frequency",
         	col="red")
    	done()
      
	p("Closing current device:",toString(curPlotDevice),"....")
    	dev.off()      
      done()
}
plot1()
