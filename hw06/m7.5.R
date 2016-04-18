# Montgomery 7.5
# confound ABCD w/blocks


levels = c(-1, 1)
y = c(90, 74, 81, 83, 77, 81, 88, 73, 98, 72, 87, 85, 99, 79, 87, 80)
df = expand.grid(A=levels, B=levels, C=levels, D=levels)
df$block = df$A * df$B * df$C * df$D
n = 1; A = df$A; B = df$B; C = df$C; D = df$D;
AB = A*B; AC = A*C; AD = A*D; BC = B*C;
BD = B*D; CD = C*D; 
ABC = A*B*C; ABD = A*B*D; BCD = B*C*D; ABCD = ABC*D
effects = data.frame(e=t(y %*% cbind(A,B,C,D,AB,AC,AD,BC,BD,CD,ABC,ABD,BCD,ABCD)/(4*n)))
effects

df[] = lapply(df, factor)
df$y = y
lmod = aov(y ~ block + A * B * C * D, df)
library(FrF2)
DanielPlot(lmod, alpha=0.1)

# to block or not in the reduced?
#amod = aov(y ~ block + A + A:B:C, df)
amod = aov(y ~ A + D + A:B + A:B:C + A:B:D, df)
options(show.signif.stars=FALSE)
summary(amod)
summary.lm(amod)
old.par = par(mfcol=c(1,2))
plot(amod)
par(old.par)

