##To download and unzip data

if(!file.exists('data.zip')){
    url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"

    download.file(url,destfile = "data.zip")
}

unzip("data.zip") # This creates the file "household_power_consumption.txt"

##To read the data into R

data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")

##To change the factor Date and Time values in to yyyy-mm-dd hh:mm:ss

data$DateTime<-paste(data$Date, data$Time)

data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

## To distinguish data from 2007-02-01 to 2007-02-02

start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

## To plot the desired data

par(mfcol=c(2,2))

 plot(data2$DateTime, as.numeric(as.character(data2$Global_active_power)),type='l',ylab="Global Active Power", xlab="")

plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)),type='l', xlab="",ylab ="Energy sub metering")
 lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),type='l', col='red')
 lines(data2$DateTime, data2$Sub_metering_3,type='l', col="blue")
  legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    lty=c(1,1,1),col=c("black","red","blue"))

plot(data2$DateTime, as.numeric(as.character(data2$Voltage)),type='l', 
    ylab="Voltage",xlab="datetime" )

plot(data2$DateTime, as.numeric(as.character(data2$Global_reactive_power)),type='l', 
    ylab="Global_reactive_power",xlab="datetime" )




