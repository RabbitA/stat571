# a
dat = read.delim("~/work/stat571/hw02/3.28.dat")
dat$material = as.factor(dat$material) # to turn integers into factors
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

library('MASS')
bc = boxcox(failure ~ material, data=dat)

# c
hist(dat$failure)
dat$log.failure = log(dat$failure)
dat$sqrt.failure = sqrt(dat$failure)
hist(dat$sqrt.failure)
hist(dat$log.failure)
boxplot(sqrt.failure ~ material, data=dat, main = 'sqrt(failure) ~ material', ylab = 'minutes to failure', xlab = 'material')
boxplot(failure ~ material, data=dat, main = 'failure ~ material', ylab = 'minutes to failure', xlab = 'material')
boxplot(log.failure ~ material, data=dat, main = 'log(failure) ~ material', ylab = 'minutes to failure', xlab = 'material')
amod2 = aov(log.failure ~ material, data=dat)
amod2.sum = unlist(summary(amod2))
amod2.sum['Pr(>F)1']

lmod.log = lm(log.failure ~ material, data=dat)
plot(residuals(lmod.log), main="Residuals log(failure) ~ material")
