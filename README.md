
# biostatscancerecon
TODO cancer deaths a porportion of population
pop data:
https://population.un.org/wpp/Download/Standard/Population/
## **To download a csv file from this github:** ##
-click on the csv file
-click on "raw" in the top right corner, it should bring you to a wall of straight text
-right click the text, click "save as" and save the file as 'all.csv'
-done!
# **Stats**
Statistic | r Value | P Value
----------|-------|--------
cancerpop / gdppc r value | .524 | 3.679e-13
infectpop / gdppc r value | -.37 | 6.438e-07
nofoodpop / gdppc r value | -.32 | 2.354e-05
**Shapiro-Wilk normality test** | *(>.05 = normally distributed)*
gdppc | | < 2.2e-16
cancerpop | | 1.046e-11
infectpop | | < 2.2e-16
**Kolmogorov And Smirnov Tests** | *if p < .05, that implies the vectors follow different distributions (stats are population controlled)*
cancer/infect | |< 2.2e-16
cancer/nofood | |< 2.2e-16
infect/nofood | |< 2.2e-16
**skewness** | |
gdppc | | 2.287668
cancerpop | | 0.9033609
infectpop | | 1.509486
nofoodpop | | 2.406604
*gdppc categories from* | *https://blogs.worldbank.org/opendata<br/>ew-country-classifications-income-level-2018-2019 (combined both medium incomes)*
*other categories are* | *low =  < first quartile, medium = between q1 and q3, high is bigger than q3*
**chi squared tests** | |
cancerpop/ gdppc   | | 1.742e-13
infectpop / gdppc  | | < 2.2e-16
nofoodpop / gdppce | |   6.752e-14
**ANOVA** | |
<br />
data:  gdppc by infectpopc
Kruskal-Wallis chi-squared = 74.401, df = 2, p-value < 2.2e-16
<br />
data:  gdppc by cancerpop
Kruskal-Wallis chi-squared = 166, df = 166, p-value = 0.4854
<br />
data:  gdppc by nofoodpop
Kruskal-Wallis chi-squared = 164.12, df = 163, p-value = 0.4606
TODO:
- [ ] ANOVA
- [ ] `cor.test` results to this `md` file
- [ ] t test