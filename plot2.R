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

data2<-data[start:end,]

## To plot the desired data

plot(data2$DateTime, as.numeric(as.character(data2$Global_active_power)),
      type='l',ylab="Global Active Power (Kilowatts)", xlab="")





