# leukemia data
dat = read.csv("~/work/stat571/hw03/4.12.dat")
dat$obs = factor(rep(1:10, 3))
amod = aov(response ~ treatment + obs, data=dat)
summary(amod)

plot(amod)

dat$response.log = log(dat$response)
amod.log = aov(response.log ~ treatment + obs, data=dat)
summary(amod.log)
plot(amod.log)

plot(residuals(amod), main="Residuals of Raw")
abline(0, 0)
plot(residuals(amod.log), main="Residuals of Log")
abline(0, 0)
