s95 <- c(11.176, 7.089, 8.097, 11.739, 11.291, 10.759, 6.467, 8.315)
s100 <- c(5.263, 6.748, 7.461, 7.015, 8.133, 7.418, 3.772, 8.963)
t.test(s95, s100, conf.level = .95)

library(pwr)
pwr.2p.test(s95, s100)

hist(s95, prob=T)
curve(dnorm(x, mean=mean(s95), sd=sd(s95)), add=TRUE)

lines(density(s95))

hist(s100)

plot(density(s100))
