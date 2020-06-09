####This code reads a data set from UC Irvine Machine Learning Repository,
#this is the information about electric power consumption. 
#The goal is to create a plot with "Global Active Power" and "Time". 


####READING, DONWLOADING AND UNZIPPING FILES
if(!dir.exists("./DataSmtf")) {dir.create("./DataSmtf")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = fileUrl, destfile = "exdata_data_household_power_consumption.zip")
unzip(zipfile = "exdata_data_household_power_consumption.zip", exdir = "Electric power consumption")

rawdata=read.csv("./Electric power consumption/household_power_consumption.txt",
                 header = TRUE, sep = ";", na.strings = "?",
                 colClasses = c(NA, NA, rep ("numeric", 7)))

## TRANSFORMATIONS.
HPCdf<-rawdata
HPCdf$Time <- paste(rawdata$Date, rawdata$Time)
HPCdf$Date <- as.Date(HPCdf$Date, "%d/%m/%Y")
HPCdf$Time <- strptime(HPCdf$Time,"%d/%m/%Y %H:%M:%S")
HPCdf<-HPCdf[HPCdf[,1]=="2007-2-1" | HPCdf[,1]=="2007-2-2",]

##sAVING PLOT IN PNG FILE.
#Open png file
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)
#Plot creation
plot(HPCdf$Time, HPCdf$Global_active_power, type = "l", ylab = " Global Active Power (kilowatts)", xlab = NA)
#Close png file
dev.off() 
