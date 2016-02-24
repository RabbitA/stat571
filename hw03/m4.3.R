dat = read.csv("~/work/stat571/hw03/m4.3.dat")
r = c(t(as.matrix(dat)))
f = colnames(dat)
k = length(f) # number of treatment levels 
n = nrow(dat) # number of control blocks
tm = gl(k, 1, n*k, factor(f))   # matching treatment 
blk = gl(n, k, k*n)        # blocking factor 
av = aov(r ~ tm + blk)
summary(av)     
