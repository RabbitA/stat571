# Montgomery 8.1
library(FrF2)
levels = c(-1, 1)
df = expand.grid(A=levels, B=levels, C=levels)
df$D = df$A * df$B * df$C
n = 1; A = df$A; B = df$B; C = df$C; D = df$D;
AB = A*B; AC = A*C; AD = A*D; BC = B*C;
BD = B*D; CD = C*D; 
ABC = A*B*C; ABD = A*B*D; BCD = B*C*D; ABCD = ABC*D
y = c(90, 72, 88, 83, 99, 81, 88, 80)
effects = data.frame(e=t(y %*% cbind(A,B,C,D,AB,AC,AD,BC,BD,CD,ABC,ABD,BCD,ABCD)/(4*n)))
effects

df[] = lapply(df, factor)
df$y = y
options(show.signif.stars=FALSE)
amod = aov(y ~ A * B * C * D, df)
#summary(amod)
#summary.lm(amod)
#plot(amod)

# Must use alpha=0.1 to find A
DanielPlot(amod, autolab=T, alpha=0.1)

# reduced model 
a2 = aov(y ~ A, df)
summary(a2)

# find coefficients for regression
coef(a2)

old.par = par(mfcol=c(1,2))
plot(a2)
par(old.par)

# A is significant

# glmod = glm(y ~ A * B * C * D, data=df, family=poisson())
# 
# coef(glmod)
# exp(confint.default(glmod))
# plot(predict(glmod), resid(glmod))

qqnorm(resid(glmod))
