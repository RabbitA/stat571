# Montgomer 8.49
library(FrF2)

levels = c(-1,1)
df = expand.grid(A=levels, B=levels, C=levels, D=levels)
df$E = df$A * df$B * df$C * df$D * -1
df[] = lapply(df, factor)
df$y = c(63,21,36,99,24,66,71,54,23,74,80,33,63,21,44,96)
df

amod = aov(y ~ A*B*C*D*E, df)
DanielPlot(amod, alpha=0.05)

options(show.signif.stars=FALSE)
reduced.amod = aov(y ~ B + E, df)
summary(reduced.amod)

coef(reduced.amod)

old.par = par(mfcol = c(1,2))
plot(reduced.amod)
par(old.par)

a2 = aov(y ~ A + B + D, df)

# levels = c(-1,1)
# df = expand.grid(A=levels, B=levels, C=levels, D=levels)
# df$AB = df$A * df$B
# df$AC = df$A * df$C
# df$AD = df$A * df$D
# df$BC = df$B * df$C
# df$BD = df$B * df$D
# df$CD = df$C * df$D
# df$ABC = df$AB * df$C
# df$BCD = df$BC * df$C
# df$ABCD = df$ABC * df$D
# df$E = -df$ABCD
# df[] = lapply(df, factor)
# df$y = c(63,21,36,99,24,66,71,54,23,74,80,33,63,21,44,96)
# df
# 
# lmod = glm(y ~ A*B*C*D*E, data=df, family=poisson())
# DanielPlot(lmod)
