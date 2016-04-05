##Download and Unzip data

if(!file.exists('data.zip')){
    url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"

    download.file(url,destfile = "data.zip")
}

unzip("data.zip") # This creates the file "household_power_consumption.txt"

##Change of Date and Time to yyyy-mm-dd hh:mm:ss

data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

##to determine the range

start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-data[start:end,]

##to plot some observations

hist(as.numeric(as.character(data2$Global_active_power)), # note we used as.character and as numeric since
                                                          # the variable is factor variable.
                main="Global Active Power",
                xlab="Global Active Power (kilowatts)", col="red")



