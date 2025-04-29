-------------------------------------------------------------------------------------------------------------------
Exploratory data analysis on England's mean temperature data from Met Office National Climate Information Centre 
Years: 1884 - 2024 
-------------------------------------------------------------------------------------------------------------------
England’s mean average temperature has been increasing over time with a noticable temperature anomality between 1959 – 2024 indicating a sharp increase in mean temperature.
To check that there was a general trend in temperature increase, loess smoothing was applied to the raw data, to remove noise from the plot to uncover a more accurate temperature trend. 


![Initial_graph](https://github.com/user-attachments/assets/e35a9a5c-726c-4624-b6c7-38b0f5cb6c98)

Figure 1: Raw temperature data from 1884 - 2024.


-------------------------------------------------------------------------------------------------------------------


Next the temperature averages from the period range of 1959-1990 were calculated and then subtracted from the mean annual temperatures for the remaining years in the dataset.
This period was selected as seen in figure 3 & 4, the method used was done to correct any anomalies in the mean values of 1959- 1990. 


![Loess_smoothing_regression_wRAW](https://github.com/user-attachments/assets/b7ce55bd-2516-418b-9741-8d43e4ec9356)

Figure 2: Raw data overlaid with Loess smoothing regression method.

![10yr_moving_average_smoothed_only](https://github.com/user-attachments/assets/3eb7f67f-6430-4a0b-9efd-46f2aa3beea1)

Figure 3: Loess smoothing regression method only

-------------------------------------------------------------------------------------------------------------------

Next the temperature averages from the period range of 1959-1990 were calculated and then subtracted from the mean annual temperatures for the remaining years in the dataset.

![Temp_anomalies_10yr_smoothed_1](https://github.com/user-attachments/assets/46577676-e184-4f58-9068-1368138e8a44)

![Temp_anomalies_10yr_smoothed_only](https://github.com/user-attachments/assets/a91be9c3-e982-4384-9b6a-08645d8afcc9)

-------------------------------------------------------------------------------------------------------------------

![Temp_anomalies_method1](https://github.com/user-attachments/assets/748f22f7-393b-4879-b92b-0b01b43ad361)

![Temp_anomalies_method2](https://github.com/user-attachments/assets/eb2d4039-d54b-4768-bb0f-e58da42d4a13)

England’s mean temperature has progressively increased steeply in the last 60 years indicating that there is a strong driver in increasing the average temperature, and is likely to be Human in origin.
