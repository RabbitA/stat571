library(lme4)
dat = read.csv("~/work/stat571/hw07/13.2.csv")
dat$part = factor(dat$part)
dat$inspector = factor(dat$inspector)
amod = lmer(y ~ inspector * (1|part), dat)
options(show.signif.stars=FALSE)
summary(amod)
plot(amod)
coef(amod)


dat.lmer = lmer(y ~ (1|inspector) + (1|part), dat)
summary(dat.lmer)
lsmeans(dat.lmer)

coef(dat.lmer)
plot(dat.lmer)

plot(fitted(dat.lmer), resid(dat.lmer))
abline(h=0, col="red")

#library(lattice)
#dat.lmer = lmer(y ~ (inspector|part), dat)
# old.par = par(mfcol=c(2,1))
# par(old.par)
#boxplot(y ~ inspector*part, data=dat, col=c("white","lightgray"),politeness)

# much variation by part
#xyplot(y ~ part, dat, main="Part")
# not much variation by inspector
#xyplot(y ~ inspector, dat, main="Inspector")
#dat.lmer = lmer(y ~ 1 + (1|inspector) + (1|part) + (1+inspector|part), dat)