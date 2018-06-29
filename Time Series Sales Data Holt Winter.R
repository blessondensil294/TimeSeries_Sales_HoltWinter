#Set Workind Directory
setwd("E:\\IMS Course Content\\Course Content\\Data Science Term 1\\7. Time Series and Forecasting\\Case Study 1")

#Read the sales data
SalesData = read.csv("Sales.csv") 

#Load the data to a Timeseries
SalesDataTS = ts(SalesData, frequency=12, start=c(2012,1)) 
#Plot the time series
plot(SalesDataTS)

#Decompose - To help us find the components in the series
Decomp = decompose(SalesDataTS) 
plot(Decomp)


#Holt Winters Modelling
SalesDataHW = HoltWinters(SalesDataTS) 
plot(SalesDataHW)

#Forecasting for the next one year
install.packages("forecast")
library(forecast) 
SalesDataFC = HoltWinters(SalesDataHW) 
plot(SalesDataFC)

#Diagnostic
acf(SalesDataFC$residuals)
Box.test(SalesDataFC$residuals, lag=20, type="Ljung-Box")

plot(SalesDataFC$residuals)
hist(SalesDataFC$residuals)