source("loadPlotData.R")

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
