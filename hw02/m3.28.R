# a
dat = read.delim("~/work/stat571/hw02/3.28.dat")
dat$material = factor(dat$material)
amod = aov(failure ~ material, data=dat)
amod.sum = unlist(summary(amod))
amod.sum['Pr(>F)1']

# b
lmod = lm(failure ~ material, data=dat)
plot(lmod)
plot(residuals(lmod))
abline(lmod)
library(car)
qqPlot(lmod, main="QQ Plot")
boxplot(failure ~ material, data=dat)

# c
dat$log.failure = log(dat$failure)
boxplot(log.failure ~ material, data=dat)
amod2 = aov(log.failure ~ material, data=dat)
amod2.sum = unlist(summary(amod2))
amod2.sum['Pr(>F)1']
lmod.log = lm(log.failure ~ material, data=dat)
plot(residuals(lmod.log), main="Residuals log(failure) ~ material")
