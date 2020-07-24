# biostatscancerecon
TODO cancer deaths a porportion of population
pop data:
https://population.un.org/wpp/Download/Standard/Population/
## **To download a csv file from this github:** ##
-click on the csv file
-click on "raw" in the top right corner, it should bring you to a wall of straight text
-right click the text, click "save as" and save the file as 'all.csv'
-done!

cancerpop / gdppc r value: .524
infectpop / gdppc r value: -.37
nofoodpop / gdppc r value: -.32
\n
t-test not applicable
\n
Shapiro-Wilk normality test (>.05 = normally distributed)
\n
gdppc: p-value < 2.2e-16
cancerpop:  p-value = 1.046e-11
infectpop: p-value < 2.2e-16
\n
Kolmogorov And Smirnov Tests, if p < .05, that implies the vectors follow different distributions (stats are population controlled).
\n
cancer/infect: p-value < 2.2e-16
cancer/nofood: p-value < 2.2e-16
infect/nofood: p-value < 2.2e-16
\n
skewness:
gdppc: 2.287668
cancerpop: 0.9033609
infectpop: 1.509486
nofoodpop: 2.406604
/n
gdppc categories from https://blogs.worldbank.org/opendata/new-country-classifications-income-level-2018-2019 (combined both medium incomes)
other categories are low =  < first quartile, medium = between q1 and q3, high is bigger than q3
/n
chi squared tests:
/n
cancerpop/ gdppc p-value = 1.742e-13
infectpop / gdppc p-value < 2.2e-16
nofoodpop / gdppc  p-value = 6.752e-14