# Montgomery 7.6

library(FrF2)
levels = c(-1, 1)
df = expand.grid(A=levels, B=levels, C=levels, D=levels)
df$ABC = df$A * df$B * df$C 
df$ABD = df$A * df$B * df$D
df[] = lapply(df, factor)
df$y = c(90, 74, 81, 83, 77, 81, 88, 73, 98, 72, 87, 85, 99, 79, 87, 80)

lmod = lm(y ~ ABC + ABD + A * B * C * D, df)
DanielPlot(lmod, alpha=0.1)

# reduced model with only significant factors
#amod = aov(y ~ ABC + ABD + A * A:B:C, df)
#amod = aov(y ~ ABC + ABD + A * D * A:B, df)
#amod = aov(y ~ A + B + C + D + A:B, df)
amod = aov(y ~ A + D + A:B, df)
options(show.signif.stars=FALSE)
summary(amod)
old.par = par(mfcol=c(1,2))
plot(amod)
par(old.par)
