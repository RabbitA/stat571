operator = factor(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)))
order = factor(1:4)
method = c('C', 'B', 'A', 'D', 'D', 'C', 'B', 'A', 'A', 'D', 'C', 'B', 'B', 'A', 'D', 'C')
obs = c(10, 7, 5, 10, 14, 18, 10, 10, 7, 11, 11, 12, 8, 8, 9, 14)
df = data.frame(operator, order, method, obs)

#matrix(df$obs, 4, 4)

# boxplots
old = par(mfrow=c(1,3))
plot(obs ~ operator + order + method, df)
par(old)


lm = aov(obs ~ operator + order + method, df)
amod = anova(lm)
plot(amod)
summary(amod)
