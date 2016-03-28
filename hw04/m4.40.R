library(car)
data = read.csv(file.path("~/work/stat571/hw04/4.40.dat"))
data$additive = factor(data$additive)
data$car = factor(data$car)
lmod = lm(y~car+additive, data)

# not very normal
qqPlot(resid(lmod))

# Shapiro says p=0.58
shapiro.test(data$y)

anova(lmod)
# an
summary(aov(y~additive+car, data))

with(data, interaction.plot(car, additive, y))

library("lsmeans")
