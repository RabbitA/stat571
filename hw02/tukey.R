expt1 <- read.delim("~/work/stat571/hw02/tukey.txt")

amod <- aov(Y~X,data=expt1)
summary(amod)

library("multcomp")
tmod <- glht(amod,linfct=mcp(X="Tukey"))
summary(tmod) 
TukeyHSD(amod, conf.level=0.95)
