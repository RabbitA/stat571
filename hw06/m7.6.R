# Montgomery 7.6

levels = c(-1, 1)
df = expand.grid(A=levels, B=levels, C=levels, D=levels)
df$ABC = df$A * df$B * df$C 
df$ABD = df$A * df$B * df$D
df$block[df$ABC ==  1 & df$ABD ==  1 ] = "I"
df$block[df$ABC ==  1 & df$ABD == -1 ] = "II"
df$block[df$ABC == -1 & df$ABD ==  1 ] = "III"
df$block[df$ABC == -1 & df$ABD == -1 ] = "IV"
df$y = c(90, 74, 81, 83, 77, 81, 88, 73, 98, 72, 87, 85, 99, 79, 87, 80)

for (v in c("A", "B", "C", "D")) {
  df[[v]] = factor(df[[v]])
}

df
lmod = glm(y ~ block + A * B * C * D, data=df, family=poisson())
DanielPlot(lmod)
