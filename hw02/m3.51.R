dat = read.delim("~/work/stat571/hw02/3.23.long.dat")
dat$fluid = factor(dat$fluid)
kruskal.test(life ~ fluid, data=dat)
