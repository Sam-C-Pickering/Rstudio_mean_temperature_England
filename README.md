UPDATING 26/10/26

An exploratory data analysis (EDA) in R of England's annual mean temperature, using data from the Met Office National Climate Information Centre. The aim is to visualise the long-term trend, strip out year-to-year noise with smoothing, and show how recent years deviate from a historical baseline period.

Summary of Findings:

1. England's mean annual temperature has risen over the 1884–2024 record, with a noticeable acceleration from roughly 1980 onwards.

2. Raw annual values are noisy (roughly 7.7 °C to 11 °C), so smoothing was applied to make the underlying trend clearer.

3. Relative to the 1959–1990 baseline, most years before 1980 sit around or below 0 °C, while nearly all years since the late 1980s are above it, reaching about +1.8 °C in the most recent years.

4. The 10-year smoothed anomaly stays close to 0 °C from about 1900 to 1980, then climbs steeply to around +1.4 °C by the end of the series.
---
Requirements
R (≥ 4.0 recommended)
timetk – used for smooth_vec() (loess smoothing)
--
Methodology:

1. Data loading

The data is read with read.table() (whitespace-separated, with header). Columns 14–17 are dropped, leaving the year, the 12 monthly values and the annual mean (ann).

2. Raw annual temperature

The annual mean temperature (ann) is plotted against year as a line plot (Figure 1).

3. Loess smoothing

timetk::smooth_vec() is applied to the annual series with span = 0.1. A span is used rather than a fixed window size so that the smoothing scales sensibly as more years are appended to the data. This gives roughly a 10-year equivalent smoothing. The smoothed line is shown overlaid on the raw data (Figure 2) and on its own (Figure 3).

4. Temperature anomalies

The mean annual temperature for 1959–1990 is calculated and subtracted from every year, giving a Diff column (the anomaly). Two views are produced:

Method 1: a scatter plot, with warmer-than-baseline years in red and cooler years in blue (Figure 4).
Method 2: a line plot of the same anomalies (Figure 5).

5. Moving-average smoothing of anomalies

A centred 10-year moving average (stats::filter() with equal weights of 1/10, sides = 2) is applied to the anomalies. It is shown overlaid on the raw anomalies (Figure 6) and on its own (Figure 7).

--

Results:

Raw data and loess smoothing

Raw data and loess smoothing

Figure 1 shows the noisy raw annual series. Figure 2 overlays the loess-smoothed line (red), which reveals a gentle rise through the 20th century and a sharp rise after about 1980.

Loess only and anomaly scatter (method 1)

Loess only and anomalies method 1

Figure 3 isolates the smoothed trend. Figure 4 shows each year's deviation from the 1959–1990 mean: blue points (cooler) dominate the early record and red points (warmer) dominate the period after the late 1980s.

Anomalies as a line (method 2) and moving average overlay

Anomalies method 2 and moving average

Figure 5 shows the anomalies as a continuous line. Figure 6 overlays the 10-year moving average (red) on the raw anomalies (black) to separate the trend from year-to-year variability.

Smoothed anomalies only

Smoothed anomalies

Figure 7 shows only the smoothed anomaly. It stays near zero for most of the 20th century and then rises steeply from the 1980s, indicating a strong recent warming signal.

--

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
