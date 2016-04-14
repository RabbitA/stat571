# Montgomery 8.1
library(FrF2)
df = FrF2(nruns=8, nfactors=4, randomize=F)
df$y = c(74, 81, 83, 73, 83, 81, 88, 90)
df
lmod = lm(y ~ A * B * C * D, df)
DanielPlot(lmod, autolab = F)

glmod = glm(y ~ A * B * C * D, data=df, family=poisson())

coef(glmod)
exp(confint.default(glmod))
plot(predict(glmod), resid(glmod))

qqnorm(resid(glmod))
