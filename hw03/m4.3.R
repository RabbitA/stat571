dat = read.csv("~/work/stat571/hw03/4.3.long.dat")
dat$bolt = factor(rep(1:5, 4))
head(dat)
amod = aov(response ~ treatment + bolt, data=dat)
summary(amod)

dat$btot = rowSums(dat)

dat

r = c(t(as.matrix(dat)))
f = colnames(dat)
k = length(f) # number of treatment levels 
n = nrow(dat) # number of control blocks
tm = gl(k, 1, n*k, factor(f))   # matching treatment 
blk = gl(n, k, k*n)        # blocking factor 
av = aov(r ~ tm + blk)
summary(av)     
