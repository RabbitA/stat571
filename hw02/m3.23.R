dat = read.delim("~/work/stat571/hw02/3.23.long.dat")
lm = lm(time ~ treatment, data=dat)
summary(lm)
anova.sum = unlist(summary(aov(lm)))
plot(lm)

plot(time ~ treatment, data=dat)
boxplot(time ~ treatment, data=dat)

lm.res = residuals(lm)
hist(lm.res)
plot(lm.res)
qqnorm(lm.res)
qqline(lm.res)

TukeyHSD(x=
