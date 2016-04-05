library(R.utils)
library(FrF2)

# two replications of A, B, C, D
vars = c("A","B","C","D")
levels = c(-1, 1)
reps = matrix( 
  c(7.037, 14.707, 11.635, 17.273, 10.403, 4.368, 9.360, 13.440, 
    8.561, 16.867, 13.876, 19.824, 11.846, 6.125, 11.190, 15.653,
    6.376, 15.219, 12.089, 17.815, 10.151, 4.098, 9.253, 12.923, 
    8.951, 17.052, 13.658, 19.639, 12.337, 5.904, 10.935, 15.053),
   ncol=2
)
Total <- apply(reps,1,sum)
exp = expand.grid(A=levels, B=levels, C=levels, D=levels)

# create a data frame by binding the observations to the exp design
dat = data.frame(cbind(exp, r=reps, Total))

n = 2; A = dat$A; B = dat$B; C = dat$C; D = dat$D;
AB = A*B; AC = A*C; AD = A*D; BC = B*C;
BD = B*D; CD = C*D; ABC = A*B*C; ABD = A*B*D; BCD = B*C*D
effects = data.frame(e=t(Total %*% cbind(A,B,C,D,AB,AC,AD,BC,CD,ABC,ABD,BCD)/(8*n)))
effects$half = effects$e/2
effects


# calc_effect = function (v) { return((Total %*% A)/(8*n))}
# 
# Aeff   = calc_effect(A)
# Beff   = calc_effect(B)
# Ceff   = calc_effect(C)
# Deff   = calc_effect(D)
# ABeff  = calc_effect(AB)
# ACeff  = calc_effect(AC)
# ADeff  = calc_effect(AD)
# BCeff  = calc_effect(BC)
# BDeff  = calc_effect(BD)
# CDeff  = calc_effect(CD)
# ABCeff = calc_effect(ABC)
# ABDeff = calc_effect(ABD)
# ABDeff = calc_effect(ABD)




# plot to find which effects are most significant
df = data.frame(rbind(cbind(exp, r=reps[,1]), cbind(exp, r=reps[,2])))
for (v in vars) {
  df[[v]] = factor(df[[v]])
}
lmod = lm(r ~ A * B * C * D, df)
DanielPlot(lmod)
summary(lmod)

options(show.signif.stars=FALSE)
amod = aov(lmod)
summary(amod)

plot(predict(amod), resid(amod))
abline(h=0)

qqnorm(resid(amod))
qqline(resid(amod))

library("DoE.base")
library("FrF2")
MEPlot(amod)
IAPlot(amod)

coefficients(lmod)
confint(lmod)
plot(lmod)

df2 = df

lm2 = lm(r ~ A + B + C + D + A*C + C*D, df)
summary(aov(lm2))

coefficients(lm2)
library(AER)
coeftest(amod)
coef(summary(amod))
mod = glm(r ~ A * B * C * D, data=dat)

# find effects of factors part (e)
A.amod = aov(r ~ A, df)
plot(predict(A.amod), resid(A.amod))

dat$range = abs(dat$r.1 - dat$r.2)
lm.range = lm(range ~ A + B + C + D + A*C + C*D, dat)
qqnorm(resid(lm.range))
boxplot(range ~ A * B * C * D, dat)
amod.range = aov(range ~ A * B * C * D, dat)
summary(amod.range)
qqnorm(resid(amod.range))
