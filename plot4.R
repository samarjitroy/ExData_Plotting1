source("loadPlotData.R")

plot4 <- function(plotDF=NULL) {
    	p("Exploratory Data Analysis.\n")
      p("Assignment: 1.\n")
      p("Author: Samarjit Roy.\n")
	p("Plot 4: Multi-paneled plot.\n")
      p("\n")
    	if(is.null(plotDF))
        	plotDF  <- loadPlotData("data")
    
      p("Set Plot Device to plot4.p as 480x480...")
    	png("plot4.png", width=480, height=480)
      curPlotDevice <- dev.cur()
      done()
      
	p("setting multi-paneled plot on device:",toString(curPlotDevice),"....")	
    	par(mfrow=c(2,2))
	done()

	p("Plotting on panel: 1...")
    	plot(plotDF$Time, plotDF$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power")
	done()

	p("Plotting on panel: 2...")
    	plot(plotDF$Time, plotDF$Voltage, type="l",
         xlab="datetime", ylab="Voltage")
	done()

	p("Plotting on panel: 3...")
    	plot(plotDF$Time, plotDF$Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
    	lines(plotDF$Time, plotDF$Sub_metering_2, col="red")
    	lines(plotDF$Time, plotDF$Sub_metering_3, col="blue")
    	legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1,
           box.lwd=0)
	done()

	p("Plotting on panel: 4...")
    	plot(plotDF$Time, plotDF$Global_reactive_power, type="n",
         xlab="datetime", ylab="Global_reactive_power")
    	lines(plotDF$Time, plotDF$Global_reactive_power)
	done()
           
	p("Closing current device:",toString(curPlotDevice),"....")
    	dev.off()      
      done()
}
plot4()
