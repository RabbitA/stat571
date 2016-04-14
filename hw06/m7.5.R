# Montgomery 7.5
# confound ABCD w/blocks

levels = c(-1, 1)
df = expand.grid(A=levels, B=levels, C=levels, D=levels)
df$ABCD = df$A * df$B * df$C * df$D
df$block[df$ABCD ==  1] = "I"
df$block[df$ABCD == -1] = "II"
df$y = c(90, 74, 81, 83, 77, 81, 88, 73, 98, 72, 87, 85, 99, 79, 87, 80)

for (v in c("A", "B", "C", "D")) {
  df[[v]] = factor(df[[v]])
}

df
lmod = lm(y ~ block + A * B * C * D, df)
DanielPlot(lmod)