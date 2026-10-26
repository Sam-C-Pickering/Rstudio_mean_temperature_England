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

base_start <- 1959   
base_end   <- 1990
anom_ylab  <- paste0("Temperature Difference from the ", base_start, "-", base_end, " Mean (°C)")
year_ticks <- seq(1884, 2024, by = 20)


# Load data in 
Mean_Eng_Temp_Raw_full <- read.table("England_temp_data.txt", header = TRUE, sep = "", strip.white = TRUE)
data_raw <- Mean_Eng_Temp_Raw_full[,-c(14,15,16,17)]

#is.na(data_raw) # checking data

# Plotting average temp of raw data
dev.new() 
plot(data_raw$year, data_raw$ann,
     xlim = c(1884, 2024), ylim = c(7, 12),
     type = "l", xaxt = "n",
     ylab = "Annual degrees °C", xlab = "Years",
     main = "Average annual temp °C")
     axis(1, at = seq(1884, 2024, by = 10), #X-axis step
     labels = seq(1884, 2024, by = 10))#  X-axis labels


smoothed_10yr <- smooth_vec(data_raw$ann, span = 0.1)# loess smoothing, span is used as more data will be added overtime.


# Plotting the smoothing with the raw to observe general trend and remove noise
dev.new()
plot(data_raw$year, data_raw$ann, 
     type = "l", ylim = range(data_raw$ann, smoothed_10yr),
     xlab = "Year", ylab = "Annual degrees °C", 
     main = "Raw data with loess smoothing (span = 0.1)",)
     lines(data_raw$year, smoothed_10yr, col = "red", lwd = 2)# Parameters for the plotting of the lines overlaid each other. 
     legend("topleft", legend = c("Original Data", "Smoothed"),
            col = c("black", "red"), lty = 1, bg = "white")# Red is the loess, black = noisy raw data
     
     
# plotting with just smoothed data
dev.new()
plot(data_raw$year, smoothed_10yr, 
     type = "l", col = "red", lwd = 2,
     ylim = range(data_raw$ann),
     xlab = "Year", ylab = "Annual degrees °C",
     main = "Loess smoothing (span = 0.1)")  
      legend("topleft", legend = "Smoothed", col = "red", lty = 1, lwd = 2)
     

      
#baseline calculation uses base_start / base_end instead of hard coded
in_base       <- data_raw$year >= base_start & data_raw$year <= base_end
baseline_mean <- mean(data_raw$ann[in_base])

# New column added to dataframe of the annual temps minus the baseline mean
data_raw$Diff <- data_raw$ann - baseline_mean

# visualization of the temperature abnormalities method 1
# Plotting how temperatures in all years deviate from the mean of the selected period.
dev.new()
plot(data_raw$year, data_raw$Diff, 
     xlab = "Year", ylab = "anom (°C)",
     main = "Temperature Anomalies method 1",
     col = ifelse(data_raw$Diff >= 0, "red", "blue"),
     pch = 16)
     abline(h = 0, col = "black", lty = 2)# Adds in 0°C dashed line

# visualization of the temperature abnormalities method 2
#
dev.new()  
n <- nrow(data_raw)
  plot(data_raw$year, data_raw$Diff,
  xlim = c(1884, 2024), ylim = c(-2, 2),
  type = "n", xaxt = "n",             
  ylab = anom_ylab,
  xlab = "Years",
  main = "Temperature Anomalies method 2")
  segments(data_raw$year[-n], data_raw$Diff[-n],
          data_raw$year[-1], data_raw$Diff[-1],
          col = ifelse(data_raw$Diff[-1] >= 0, "red", "blue"))
          axis(1, at = year_ticks)# Adds in year intervals of 20 years
          abline(h = 0, col = "black", lty = 2)# Adds in 0°C dashed line
     


# creating moving avg variable for plot
smoothed_10yr_moving_avg <- as.numeric(stats::filter(data_raw$Diff, rep(1/10, 10), sides = 2))
          

# plots the smoothed with the raw data.
dev.new()   
plot(data_raw$year, data_raw$Diff,
     type = "l", xaxt = "n",             
     ylim = c(-2, 2),
     xlab = "Years",
     ylab = anom_ylab,                  
     main = "Temperature Anomalies with 10-year Moving Average")  
lines(data_raw$year, smoothed_10yr_moving_avg, col = "red", lwd = 2)
axis(1, at = year_ticks)
abline(h = 0, col = "blue", lty = 2)
legend("topleft", legend = c("10-year moving average", "Original"),
       col = c("red", "black"), lty = 1, bg = "white")

# plots just the smoothed data
dev.new()  
plot(data_raw$year, smoothed_10yr_moving_avg,
     type = "l", lwd = 2, xaxt = "n",   
     ylim = c(-2, 2),
     xlab = "Years",
     ylab = anom_ylab,                  
     main = "10-year Moving Average of Temperature Anomalies")   
axis(1, at = year_ticks)
abline(h = 0, col = "blue", lty = 2)# Adds the 0 degree line mark for better visualisation