source("loadPlotData.R")

plot2 <- function(plotDF=NULL) {
    	p("Exploratory Data Analysis.\n")
      p("Assignment: 1.\n")
      p("Author: Samarjit Roy.\n")
	p("Plot 2: Global Active Power (kilowatts).\n")
      p("\n")
    	if(is.null(plotDF))
        	plotDF  <- loadPlotData("data")
    
      p("Set Plot Device to plot2.p as 480x480...")
    	png("plot2.png", width=480, height=480)
      curPlotDevice <- dev.cur()
      done()
      
	p("Plotting line on device:",toString(curPlotDevice),"...")
    	plot(plotDF$Time, plotDF$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
    	done()
      
	p("Closing current device:",toString(curPlotDevice),"....")
    	dev.off()      
      done()
}
plot2()
