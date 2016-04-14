# Montgomer 8.49
library(FrF2)

#exp = FrF2(nruns=16, nfactors=5, design="2.5-1")

levels = c(-1,1)
df = expand.grid(A=levels, B=levels, C=levels, D=levels)
df$AB = df$A * df$B
df$AC = df$A * df$C
df$AD = df$A * df$D
df$BC = df$B * df$C
df$BD = df$B * df$D
df$CD = df$C * df$D
df$ABC = df$AB * df$C
df$BCD = df$BC * df$C
df$ABCD = df$ABC * df$D
df$E = -df$ABCD

for (col in colnames(df)) {
  df[[col]] = factor(df[[col]])
}

df$y = c(63,21,36,99,24,66,71,54,23,74,80,33,63,21,44,96)
df
lmod = glm(y ~ A*B*C*D*E, data=df, family=poisson())
DanielPlot(lmod)
