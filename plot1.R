####This code reads a data set from UC Irvine Machine Learning Repository,
#this is the information about electric power consumption. 
#The goal is to create a plot that XXXXXXXX. This code is part of a 
#set of files each of which generates one single plot.


####READING, DONWLOADING AND UNZIPPING FILES
if(!dir.exists("./DataSmtf")) {dir.create("./DataSmtf")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = fileUrl, destfile = "exdata_data_household_power_consumption.zip")
unzip(zipfile = "exdata_data_household_power_consumption.zip", exdir = "Electric power consumption")

rawdata=read.csv("./Electric power consumption/household_power_consumption.txt",
                 header = TRUE, sep = ";", na.strings = "?",
                 colClasses = c(NA, NA, rep ("numeric", 7)))

HPCdf<-rawdata
HPCdf$Date <- as.Date(HPCdf$Date, "%d/%m/%Y")
HPCdf$Time <- strptime(HPCdf$Time,"%H:%M:%S")
HPCdf<-HPCdf[HPCdf[,1]=="2007-2-1" | HPCdf[,1]=="2007-2-2",]


hist(HPCdf$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power")


