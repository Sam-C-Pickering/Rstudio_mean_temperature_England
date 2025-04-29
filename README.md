-------------------------------------------------------------------------------------------------------------------
Exploratory data analysis on England's mean temperature data from Met Office National Climate Information Centre 
Years: 1884 - 2024 
-------------------------------------------------------------------------------------------------------------------
England’s mean average temperature has been increasing over time with a noticable temperature anomality between 1959 – 2024 indicating a sharp increase in mean temperature.
To check that there was a general trend in temperature increase, loess smoothing was applied to the raw data, to remove noise from the plot to uncover a more accurate temperature trend. 


![Initial_graph](https://github.com/user-attachments/assets/e35a9a5c-726c-4624-b6c7-38b0f5cb6c98)

Figure 1: Raw temperature data from 1884 - 2024.

![Loess_smoothing_regression_wRAW](https://github.com/user-attachments/assets/b7ce55bd-2516-418b-9741-8d43e4ec9356)

Figure 2: Raw data overlaid with Loess smoothing regression method.

![10yr_moving_average_smoothed_only](https://github.com/user-attachments/assets/3eb7f67f-6430-4a0b-9efd-46f2aa3beea1)

Figure 3: Loess smoothing regression method only

-------------------------------------------------------------------------------------------------------------------



Next the temperature averages from the period range of 1959-1990 were calculated and then subtracted from the mean annual temperatures for the remaining years in the dataset to show the deviation from the selected period.


![Temp_anomalies_method1](https://github.com/user-attachments/assets/51f8de9a-e55b-45f2-bb13-c50e88c6f7da)

Figure 4: 1959-1990 Temperature anomalie method 1


![Temp_anomalies_method2](https://github.com/user-attachments/assets/65bd43d1-4379-465c-8098-81709bb4ed17)

Figure 5: 1959-1990 Temperature anomalie method 2

-------------------------------------------------------------------------------------------------------------------

![Temp anom1](https://github.com/user-attachments/assets/11356a5d-a3c0-400f-be1a-607440c63f5b)


Figure 6: 1959-1990 Temperature anomalie average loess smoothing 10 yr moving average overlaid with raw data.


![temp anom2](https://github.com/user-attachments/assets/0eea8cbc-1a7a-4a08-b798-7adc7f1a4140)

Figure 7: 1959-1990 Temperature anomalie average loess smoothing 10 yr moving average.

England’s mean temperature has progressively increased steeply in the last 65 years indicating that there is a strong driver in increasing the average temperature, and is likely to be Human in origin.
