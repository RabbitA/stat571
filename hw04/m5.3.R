library(car)
dat = read.csv("~/work/stat571/hw04/5.3.dat")
dat$temperature = factor(dat$temperature)
dat$pressure = factor(dat$pressure)
shapiro.test(dat$y)
lm1 = lm(y~temperature+pressure, dat)
qqPlot(lm1)
plot(residuals(lm1))

library(car)
qqPlot(resid(lm1))
plot(dat$temperature, fitted(lm1))
plot(fitted(lm1))

plot(dat$y, dat$pressure)
plot(dat$temperature, , main="Res v Temp", xlab="Temp")
plot(dat$pressure, residuals(lm(y~pressure, dat)), main="Res v Pressure", xlab="Pressure")

plot(resid(lm(y~pressure, dat)))
lmod = lm(y~temperature+pressure+temperature*pressure, data=dat)
plot(dat$pressure, resid(lmod), main="Res v Fitted", xlab="Temperature", ylab="Residuals")
abline(0,0)
summary(aov(lmod))


plot(lmod, data=dat, ylab="Yield", main="yield ~ temp/pres")


with(dat, interaction.plot(temperature, pressure, y))
with(dat, interaction.plot(pressure, temperature, y))
