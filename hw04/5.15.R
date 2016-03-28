dat = read.csv("~/work/stat571/hw04/5.15.dat")
dat$Row = factor(dat$Row)
dat$Col = factor(dat$Col)
amod = aov(y~Row+Col, data=dat)
summary(amod)

library(dae)
amod = aov(y ~ Row + Col + Error(Row/Col), data=dat)
tukey.1df(amod, dat, error.term="Row:Col")


library(additivityTests)
mat = matrix(c(36,18,30,39,20,37,36,22,33,32,20,34), nrow=3)
tukey.test(mat, alpha=0.05)
