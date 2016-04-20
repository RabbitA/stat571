library(lme4)
library(lattice)

dat = read.csv("~/work/stat571/hw07/13.2.csv")
dat$part = factor(dat$part)
dat$inspector = factor(dat$inspector)
dat$test = factor(dat$test)

# old.par = par(mfcol=c(2,1))
# par(old.par)

# much variation by part
xyplot(y ~ part, dat, main="Part")

# not much variation by inspector
xyplot(y ~ inspector, dat, main="Inspector")

boxplot(y ~ inspector*part, data=dat, col=c("white","lightgray"),politeness)

dat.lmer = lmer(y ~ 1 + (1|inspector) + (1|part), dat)
#dat.lmer = lmer(y ~ 1 + (1|inspector) + (1|part) + (1+inspector|part), dat)
summary(dat.lmer)
coef(dat.lmer)
