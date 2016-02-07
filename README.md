## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1

## plot1.R

The Plot1 script (plot1.R) does the following:
1. Souce loadPlotData.R - The common code to load required data.
	* Download data from "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	* Unzip data file
	* Load Data for "2007-02-01", "2007-02-02" only as data frame 
2. set plot Device (480x480) as png file
3. Craete Histogram 
4. Clode Device file

## Running the script
To run the script, source `plot1.R`. After running, you will see the following output as the script works:
```
[Sat Feb 06 20:45:01 2016 ] Exploratory Data Analysis.
[Sat Feb 06 20:45:01 2016 ] Assignment: 1.
[Sat Feb 06 20:45:01 2016 ] Author: Samarjit Roy.
[Sat Feb 06 20:45:01 2016 ] Plot 1: Global Active Power.
[Sat Feb 06 20:45:01 2016 ] 
[Sat Feb 06 20:45:01 2016 ] if current directory does not have data subdir, create one...completed.
[Sat Feb 06 20:45:01 2016 ] download zip file from the source...completed.
[Sat Feb 06 20:45:01 2016 ] if zip file exists, unzip with overwrite..completed.
[Sat Feb 06 20:45:03 2016 ] Finding Last row number for Date '2007-02-01'  '2007-02-02'.....completed.
[Sat Feb 06 20:45:12 2016 ] Load Data into Data Frame with limited rows( 69517 ) from the lardge file..completed.
[Sat Feb 06 20:45:13 2016 ] convert date and time variables to Date/Time class...completed.
[Sat Feb 06 20:45:14 2016 ] only use data from the dates 2007-02-01 and 2007-02-02...completed.
[Sat Feb 06 20:45:14 2016 ] Set Plot Device to plot1.p as 480x480...completed.
[Sat Feb 06 20:45:14 2016 ] Creating Histogram on device: 2 ...completed.
[Sat Feb 06 20:45:14 2016 ] Closing current device: 2 ....completed.
```
![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

