r = c(7,9,34,55,16,20,40,60,8,10,32,50,18,21,44,61,
      8,12,35,52,15,22,45,65,6,10,30,53,15,20,41,63)
levels = c(-1,1)
exp = expand.grid(A=levels, B=levels, C=levels, D=levels, E=levels)

df = data.frame(exp,r)
df$AB=df$A*df$B;
df$AC=df$A*df$C;
df$AD=df$A*df$D;
df$BC=df$B*df$C;
df$BD=df$B*df$D;
df$CD=df$C*df$D;
df$ABC=df$AB*df$C;
df$ABD=df$AB*df$D;
df$ACD=df$AC*df$D;
df$BCD=df$BC*df$D;
df$ABCD=df$ABC*df$D;
amod = aov(r ~ A * B * C * D * E, df)
summary(amod)
summary.lm(amod)
qqnorm(resid(amod))
