c1 = c(9, 12, 10, 8, 15)
c2 = c(20, 21, 23, 17, 30)
c3 = c(6, 5, 8, 16, 7)

qqnorm(c1)
qqline(c1)

qqnorm(c2)
qqline(c2)

qqnorm(c3)
qqline(c3)

boxplot(c1, c2, c3)

df = stack(data.frame(c1, c2, c3))
colnames(df) = c("response", "circuit")
plot(response ~ circuit, data=df)
results = aov(response ~ circuit, data=df)
summary(results)

