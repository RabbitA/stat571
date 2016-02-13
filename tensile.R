tensile.dat = read.delim("~/work/stat571/tensile.dat")
lm = lm(strength ~ pct, data=tensile.dat)
plot(lm)
plot(strength ~ time, data=tensile.dat)

lm.res = residuals(lm)
plot(y=lm.res, x=tensile.dat$time)
abline(0, 0)

hist(lm.res)
plot(lm.res)
qqplot(y=lm.res, x=tensile.dat$strength)
qqline(y=lm.res)

shapiro.test(tensile.dat$strength)
bartlett.test(tensile.dat$strength, tensile.dat$pct)

library(car)
qqPlot(lm)
leveragePlots(lm)
outlierTest(lm)
#leveneTest(strength ~ pct, data=tensile.dat)

library(MASS)
sresid = studres(lm)
hist(sresid)

plot(strength ~ pct, data=tensile.dat)
boxplot(strength ~ pct, data=tensile.dat)
glm = glm(strength ~ pct, data=tensile.dat)
summary(glm)
?glm
