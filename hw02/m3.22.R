dat = read.delim("~/work/stat571/hw02/3.22.dat")
aov = aov(response ~ circuit, data=dat)
aov.sum = unlist(summary(aov))
aov.sum['Pr(>F)1']

TukeyHSD(x=aov, "circuit")

lm = lm(response ~ circuit, data=dat)
plot(lm)
boxplot(response ~ circuit, data=dat, xlab="Circuit", ylab="Response")

c1 = c(9, 12, 10, 8, 15)
c2 = c(20, 21, 23, 17, 30)
c3 = c(6, 5, 8, 16, 7)

c1.lm = lm(c2 ~ c3)
plot(c1.lm)


qqnorm(c1)
qqline(c1)

qqnorm(c2)
qqline(c2)

qqnorm(c3)
qqline(c3)

boxplot(c1, c2, c3)

df = data.frame(response = c(c1, c2, c3), circuit = c(rep("c1", 5), rep("c2", 5), rep("c3", 5)))
df = data.frame(stack(data.frame(c1 = c1, c2 = c2, c3 = c3)))
df = stack(data.frame(c1, c2, c3))
colnames(df) = c("response", "circuit")
plot(response ~ circuit, data=df)
lm = lm(response ~ circuit, data=df)

results = aov(response ~ circuit, data=df)
res.sum = summary(aov(lm))

#res.sum = summary(results)

pv = res.sum

