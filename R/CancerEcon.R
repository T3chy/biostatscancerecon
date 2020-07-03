require("spatstat.utils")
library(plyr)
require("tidyverse")
require("icd")
require(data.table)
data <- read.csv("C:\\Users\\Techy\\Downloads\\Morticd9")
data$Cause <- sub("A", "", data$Cause)
data$Cause <- sub("B", "", data$Cause)
neoplasmdeaths <- filter(data, str_detect(explain_code(Cause, condense= FALSE), "neoplasm")) # all death causes mentioning neoplasm which is the big cancer death one
neoplasmdeaths <- filter(neoplasmdeaths, Year == "1985" | Year == "1995" | Year == "2005" | Year == "2010")
GDPpercapita <- read.csv("C:\\Users\\Techy\\Downloads\\SYB62_230_201904_GDP and GDP Per Capita.csv")
GDPpercapita <- filter(GDPpercapita, X == "1985" | X == "1995" | X == "2005" | X== "2010") # Getting homogenous years on the data, these years are the only ones where we have data for both
straightdeaths <- data.frame(neoplasmdeaths$Country,neoplasmdeaths$Year,neoplasmdeaths$Deaths1)
aggdeaths <- aggregate(neoplasmdeaths.Deaths1 ~neoplasmdeaths.Country+neoplasmdeaths.Year, data=straightdeaths, sum)
aggdeaths <- aggdeaths[with(aggdeaths, order(neoplasmdeaths.Country)), ]
names(aggdeaths) = c("country","year","AllDeaths")
WHO <- as.data.frame(fread("~/WHOCountryCodes.tsv"))
mergedcodes <- read.csv("~/mergedcodes.csv")
newaggdeaths <- as.data.frame(lapply(aggdeaths, function(x) mergedcodes$X158[match(x,mergedcodes$V1)]))
neoaggdeaths <- data.frame(newaggdeaths$country,aggdeaths$year,aggdeaths$AllDeaths)
GDPpercapita <- filter(GDPpercapita, X.T13.. %in% neoaggdeaths$newaggdeaths.country)
GDPpercapita <- filter(GDPpercapita, X.1 == "GDP per capita (US dollars)")
GDPpercapita <- select(GDPpercapita,X.T13.., X, X.2)
deaths <- arrange(neoaggdeaths,newaggdeaths.country)
all <- merge(deaths,GDPpercapita, by.x=c("newaggdeaths.country","aggdeaths.year"), by.y = c("X.T13..","X"))
rm(aggdeaths)
rm(data)
rm(deaths)
rm(GDPpercapita)
rm(neoplasmdeaths)
rm(neoaggdeaths)
rm(mergedcodes)
rm(newaggdeaths)
rm(WHO)
rm(straightdeaths)
pop <- as.data.frame(readxl::read_excel("A:\\Classes\\biostats\\pop.xlsx"))
pop <- select(pop,...5,...43,...53,...63,...68)
pop <- tail(npop, -11)
## pop <- data.frame(t(pop[-1])) on the fence abt this
names(pop) = c("x","country","1985","1995","2005","2010")
               
               
mergedata <- as.data.frame(readxl::read_xlsx("allmerged.xlsx"))
scatter.smooth(x=mergedata$GDPPC, y=mergedata$DeathsPC, main="Cancer-Related Deaths Per Capita ~ GDP Per Capita")                
data <- as.data.frame(dplyr::filter(mergedata, Year == '1995'))
data <- as.data.frame(dplyr::filter(mergedata, Year == '1985'))
data <- as.data.frame(dplyr::filter(mergedata, Year == '2005'))
data <- as.data.frame(dplyr::filter(mergedata, Year == '2010'))

setwd("A:\\Classes\\biostatscancerecon\\raw_data")
newdeaths <- read.csv('newdeaths.csv')
newdeaths <- tail(newdeaths,-2)
deathcodes <- merge(x=newdeaths,y=codes, by.x = "X6", by.y = "X.2")
names(deathcodes) <- c("Country","X","infect",'nofood','cancer','code')
deathcodes <- select(deathcodes,!X)
deathpop <- merge(deathcodes,pop,by.x = 'code', by.y = 'country')
scatter.smooth(deathpop$infect,deathpop$nofood)
gdppc <- select(gdppc, Country.or.Area, Value)
names(gdppc) <- c("country","gdppc")
all <- merge(deathpop, gdppc, by.x = "Country", by.y = "country")
all <- read.csv("all.csv")





all$cancer <- as.numeric(levels(all$cancer)[all$cancer])
all$nofood <- as.numeric(levels(all$nofood)[all$nofood])
all$infect <- as.numeric(levels(all$infect)[all$infect])
all$pop <- as.numeric(levels(all$pop)[all$pop])
all$cancerpop <- all$cancer / all$pop
all$infectpop <- all$infect / all$pop
all$nofoodpop <- all$nofood / all$pop

# start here if you've downloaded the all.csv
library(ggplot2)
# if it says no package called 'ggplot2' or something, run 
install.packages('ggplot2')
all <- read.csv("all.csv")
ggplot(data = all, aes(x=all$gdppc, y=all$nofoodpop, group=1,color='nofood')) + xlab("GDP per capita")+ ylab("Deaths per capita")+ geom_smooth(method = "lm", formula = y ~ x) + geom_smooth(data = all, aes(x=all$gdppc, y=all$infectpop, group=1,color='infect'),method = "lm", formula = y ~ x) + geom_smooth(data = all, aes(x=all$gdppc, y=all$cancerpop, group=1, color='cancer'), method='lm')
liboxplot(all$cancerpop)
boxplot(all$infectpop)
boxplot(all$nofoodpop)
