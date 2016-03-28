dat = read.csv("~/work/stat571/hw04/5.21.dat")
dat$day = factor(dat$day)
dat$pressure = factor(dat$pressure)
lmod = lm(y~day+temp+pressure+temp*pressure, dat)
summary(aov(lmod))
plot(lmod)


library(car)
plot(residuals(lmod))
