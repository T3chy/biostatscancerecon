
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
cancerpop/ gdppc   | | 1.742e-13 X-squared = 71.805
infectpop / gdppc  | | < 2.2e-16 X-squared = 93.987
nofoodpop / gdppce | |   6.752e-14 X-squared = 73.808
**ANOVA** | |
<br />
data:  comparing infection deaths per capita versus economic categories
Kruskal-Wallis chi-squared = 91.45, df = 3, p-value < 2.2e-16
<br />
data:  comparing cancer deaths per capita versus economic categories
Kruskal-Wallis chi-squared = 61.579, df = 3, p-value = 2.703e-13
<br />
data: comparing malnutrition deaths per capita versus economic categories
Kruskal-Wallis chi-squared = 60.515, df = 3, p-value = 4.562e-13
**Wilcoxon rank sum test (comparing all countries who scored "low"(lower than Q1) on the respective populatio controlled mortality cause)** | |

data:  lowcancer$gdppc and lowinfect$gdppc
W = 224, p-value = 3.939e-09
alternative hypothesis: true location shift is not equal to 0
<br />

data:  lowcancer$gdppc and lownofood$gdppc
W = 346, p-value = 1.625e-06
alternative hypothesis: true location shift is not equal to 0
<br />
data:  lowinfect$gdppc and lownofood$gdppc
W = 1145, p-value = 0.01862
alternative hypothesis: true location shift is not equal to 0
NOTE THAT THE P VALUE IS MAD HIGHER HERE THIS IS IMPORTANT CUZ POOR COUNTRIES DONT GET CANCER BUT THEY GET NO FOOD AND INFECT DEATHS SOMEWHAT MORE RELATEDLEY


TODO:
- [ ] `cor.test` results to this `md` file



> chisq.test(all$gdppcc, all$infectpopc)

	Pearson's Chi-squared test

data:  all$gdppcc and all$infectpopc
X-squared = 93.987, df = 6, p-value < 2.2e-16

> chisq.test(all$gdppcc, all$nofoodpopc)

	Pearson's Chi-squared test

data:  all$gdppcc and all$nofoodpopc
X-squared = 73.808, df = 6, p-value = 6.752e-14

> chisq.test(all$gdppcc, all$cancerpopc)

	Pearson's Chi-squared test

data:  all$gdppcc and all$cancerpopc
X-squared = 71.805, df = 6, p-value = 1.742e-13

> summary(all$gdppc)
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
    90.73   1357.99   4480.79  12367.52  13129.38 104771.86 
> summary(all$nofoodpop)
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
3.070e-07 6.895e-06 3.060e-05 9.392e-05 1.232e-04 9.558e-04 
> summary(all$infectpop)
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
0.0000150 0.0001271 0.0002822 0.0011894 0.0016448 0.0067109 
> summary(all$cancerpop)
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
0.0001296 0.0005438 0.0007618 0.0011561 0.0017122 0.0032679 
> kruskal.test(all$gdppc, all$infectpopc)

	Kruskal-Wallis rank sum test

data:  all$gdppc and all$infectpopc
Kruskal-Wallis chi-squared = 74.401, df = 2, p-value <
2.2e-16

> kruskal.test(all$infectpop, all$gdppcc)

	Kruskal-Wallis rank sum test

data:  all$infectpop and all$gdppcc
Kruskal-Wallis chi-squared = 91.45, df = 3, p-value <
2.2e-16

> kruskal.test(all$nofoodpop, all$gdppcc)

	Kruskal-Wallis rank sum test

data:  all$nofoodpop and all$gdppcc
Kruskal-Wallis chi-squared = 60.515, df = 3, p-value =
4.562e-13

> kruskal.test(all$cancerpop, all$gdppcc)

	Kruskal-Wallis rank sum test

data:  all$cancerpop and all$gdppcc
Kruskal-Wallis chi-squared = 61.579, df = 3, p-value =
2.703e-13
> library(e1071)
> skewness(all$gdppc)
[1] 2.287668
> skewness(all$infectpop)
[1] 1.509486
> skewness(all$nofoodpop)
[1] 2.406604
> skewness(all$cancerpop)
[1] 0.9033609