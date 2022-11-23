mean(Pulmones$Capacity)
sd(Pulmones$Capacity)

########## First Hypothesis ##########
Binomial_Counter <- table(Pulmones$Gender)

Binomial_Counter
binom.test(x=Binomial_Counter, alternative="two.sided", 
           conf.level = 0.95)

########## Second Hypothesis ##########
library(dplyr)

Pulmones_Age_Filter = filter(Pulmones, Age>=14)
Fisher_Counter <- table(Pulmones_Age_Filter$Caesarean, 
                 Pulmones_Age_Filter$Smoke, 
                 dnn=c("Cesárea", "  Fumador"))

Fisher_Counter
fisher.test(x=Fisher_Counter, alternative="two.sided")

########## Third Hypothesis ##########
aggregate(Capacity~Caesarean, data=Pulmones, FUN=mean)
aggregate(Capacity~Caesarean, data=Pulmones, FUN=sd)

Capacity_by_Natural_Birth = subset(Pulmones$Capacity,
                                   Pulmones$Caesarean=="no")
Capacity_by_Caesarean_Birth = subset(Pulmones$Capacity,
                                     Pulmones$Caesarean=="yes")

ggplot(data=Pulmones, aes(x=Caesarean, y=Capacity, color=Caesarean))+ 
geom_boxplot()+theme_bw()

shapiro.test(Capacity_by_Natural_Birth)
shapiro.test(Capacity_by_Caesarean_Birth)

wilcox.test(x=Capacity_by_Natural_Birth, y=Capacity_by_Caesarean_Birth,
            alternative="two.sided", mu=0, paired=FALSE, conf.level=0.95)
