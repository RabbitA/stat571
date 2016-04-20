library(lattice)
dat = read.csv("~/work/stat571/hw07/13.1.csv")
dat$part = factor(dat$part)
dat$operator = factor(dat$operator)
dat$measure = factor(dat$measure)

xyplot(y ~ part, dat, main="Part")
xyplot(y ~ operator, dat, main="Part")
