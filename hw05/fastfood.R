setwd("~/work/stat571/hw05")
df3 = read.csv("fastfood.csv")
df3
r = c(t(as.matrix(df3)))
f1 = c("Item1", "Item2", "Item3")
f2 = c("East", "West")
k1 = length(f1)  
k2 = length(f2)
n = 4

tm1 = gl(k1, 1, n*k1*k2, factor(f1)) 
tm2 = gl(k2, 1, n*k1*k2, factor(f2)) 
av = aov(r ~ tm1 * tm2)
summary(av)
