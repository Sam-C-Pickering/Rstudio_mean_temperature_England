##########################
#
# EDA Stats England's Average Temperature 1884 - 2024
#
# Sam Pickering
#
##########################

install.packages("timetk")
library(timetk) # for smoothing

#getwd()


# Load data in 
Mean_Eng_Temp_Raw_full <- read.table("England_temp_data.txt", header = TRUE, sep = "", strip.white = TRUE)
data_raw <- Mean_Eng_Temp_Raw_full[,-c(14,15,16,17)]

#is.na(data_raw) # checking data

# Plotting average temp of raw data
x11()
plot(data_raw$year, data_raw$ann,
     xlim = c(1884, 2024), ylim = c(7, 12),
     type = "l", xaxt = "n",
     ylab = "Annual degrees °C", xlab = "Years",
     main = "Average annual temp °C")
     axis(1, at = seq(1884, 2024, by = 10), #X-axis step
     labels = seq(1884, 2024, by = 10))#  X-axis labels


smoothed_10yr <- smooth_vec(data_raw$ann, span = 0.1)# loess smoothing, span is used as more data will be added overtime.


# Plotting the smoothing with the raw to observe general trend and remove noise
x11()
plot(data_raw$year, data_raw$ann, 
     type = "l", ylim = range(data_raw$ann, smoothed_10yr),
     xlab = "Year", ylab = "Annual degrees °C", 
     main = "10-year Moving Average Equivalent Smoothing",)
     lines(data_raw$year, smoothed_10yr, col = "red")# Parameters for the plotting of the lines overlaid each other. 
     legend("topleft", legend = c("Original Data", "Smoothed"), col = c("black", "red"), lty = 1)# Red is the loess, black = noisy raw data
     
     
# plotting with just smoothed data
x11()
plot(data_raw$year, smoothed_10yr, 
     type = "l", ylim = range(data_raw$ann),
     xlab = "Year", ylab = "Annual degrees °C", 
     main = "10-year Moving Average Equivalent Smoothing",)
     lines(data_raw$year, smoothed_10yr, col = "red")# Parameters for the plotting of the lines overlaid each other. 
     legend("topright", legend = c("Smoothed"), col = c( "red"), lty = 1)# Red is the loess
     

# logic variable For comparison of values in dataframe to select values between 1959 and 1990 to observe temperature anomalies.
subset_years <- data_raw$year >= 1959 & data_raw$year <= 1990

# Applying logic to the dataframe and creating a new variable for the desired time frame
subset_data <- data_raw[subset_years, ]

# Calculating the mean of the years
mean_1959_1990 <- mean(subset_data$ann)

# New column added to dataframe of the annual temps minus the mean values from 1961 to 1990
data_raw$Diff <- data_raw$ann - mean_1959_1990

# visualization of the temperature abnormalities method 1
# Plotting how temperatures in all years deviate from the mean of the selected period.
x11()
plot(data_raw$year, data_raw$Diff, 
     xlab = "Year", ylab = "Temperature Difference from the 1959-1990 Mean (°C)",
     main = "Temperature Anomalies method 1",
     col = ifelse(data_raw$Diff >= 0, "red", "blue"),
     pch = 16)
     abline(h = 0, col = "black", lty = 2)# Adds in 0°C dashed line

# visualization of the temperature abnormalities method 2
#
x11()
plot(data_raw$year, data_raw$Diff, 
     xlim = c(1884, 2024), ylim = c(-2, 2),  
     type = "l", xaxt = "n", 
     ylab = "Temperature Difference from the 1959-1990 Mean (°C)", 
     xlab = "Years",
     main = "Temperature Anomalies method 2",
     col = ifelse(data_raw$Diff >= 0, "red", "blue"))  
     axis(1, at = seq(1884, 2024, by = 20))# Adds in year intervals of 20 years
     abline(h = 0, col = "black", lty = 2)# Adds in 0°C dashed line 


# creating loess smoothing variable for plot
smoothed_10yr_moving_avg <- stats::filter(data_raw$Diff, rep(1/10, 10), sides = 2)

# plots the smoothed with the raw data.
x11()
plot(data_raw$year, data_raw$Diff, 
     type = "l",
     ylim = c(-2, 2),  
     xlab = "Years",
     ylab = "Temperature Difference from 1961-1990 Mean (°C)",
     main = "Temperature Anomalies")
     lines(data_raw$year, smoothed_10yr_moving_avg , col = "red")# Adds smoothed line to the plot
     axis(1, at = seq(1660, 2020, by = 20))# Adds the 20 year intervals
     abline(h = 0, col = "blue", lty = 2)# Adds the 0 degree line mark for better visualisation
     legend("topleft", legend = c("Smoothed","original"), col = c( "red","black"), lty = 1)

# plots just the smoothed data
x11()
plot(data_raw$year, smoothed_10yr_moving_avg, 
     type = "l",
     ylim = c(-2, 2),  
     xlab = "Years",
     ylab = "Temperature Difference from 1961-1990 Mean (°C)",
     main = "Temperature Anomalies")
     axis(1, at = seq(1660, 2020, by = 20))# Adds the 20 year intervals
     abline(h = 0, col = "blue", lty = 2)# Adds the 0 degree line mark for better visualisation


