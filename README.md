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

Figure 1 shows the noisy raw annual series. Figure 2 overlays the loess-smoothed line (red), which reveals a gentle rise through the 20th century and a sharp rise after about 1980.

Figure 3 isolates the smoothed trend. Figure 4 shows each year's deviation from the 1959–1990 mean: blue points (cooler) dominate the early record and red points (warmer) dominate the period after the late 1980s.

Figure 5 shows the anomalies as a continuous line. Figure 6 overlays the 10-year moving average (red) on the raw anomalies (black) to separate the trend from year-to-year variability.

Figure 7 shows only the smoothed anomaly. It stays near zero for most of the 20th century and then rises steeply from the 1980s, indicating a strong recent warming signal.

--
<img width="664" height="664" alt="raw_data_smoothing_0 1" src="https://github.com/user-attachments/assets/f2400fca-15ee-41f1-8fce-6ba83b102048" />

Figure 1: Raw temperature data from 1884 - 2024.

<img width="664" height="664" alt="smoothed_w_raw" src="https://github.com/user-attachments/assets/5a7deb20-fe7b-4284-9e17-603490ebe898" />

Figure 2: Raw data overlaid with Loess smoothing regression method.

<img width="664" height="664" alt="only_smoothing" src="https://github.com/user-attachments/assets/7d5c90cd-6774-42c7-bf07-23344854c014" />

Figure 3: Loess smoothing regression method only

-------------------------------------------------------------------------------------------------------------------


<img width="664" height="664" alt="anom_meth_1" src="https://github.com/user-attachments/assets/d08e0d74-97a3-450c-ac30-2ba1f4c02625" />

Figure 4: 1959-1990 mean Temperature difference method 1

<img width="664" height="664" alt="method2" src="https://github.com/user-attachments/assets/8c2a15cb-d890-4826-8435-feac1e26cac2" />

Figure 5: 1959-1990 mean Temperature difference method 2

-------------------------------------------------------------------------------------------------------------------

<img width="664" height="664" alt="smoothed_only" src="https://github.com/user-attachments/assets/0303de17-6b12-4217-a0f9-548443f1c887" />


Figure 6: 1959-1990 Temperature anomaly mean loess smoothing 10 yr moving average overlaid with raw data.


<img width="664" height="664" alt="smoothed_w_raw" src="https://github.com/user-attachments/assets/38ba6103-edfd-43fe-8440-6aec718c6daf" />

Figure 7: 1959-1990 Temperature anomaly mean loess smoothing 10 yr moving average.


