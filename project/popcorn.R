# popcorn
unpopped = c(332,338,320,389,398,411,88,113,88,277,268,283,379,381,
             394,84,100,127,262,295,288,388,371,369,248,86,108)
additive = c(rep("none", 9), rep("olive", 9), rep("butter", 9))
power = rep(c(rep("900", 3), rep("1000", 3), rep("1200", 3)), 3)
dat = data.frame(additives, power, unpopped)
mod = aov(unpopped ~ additive * power, dat)
options(show.signif.stars=FALSE)
summary(mod)

old.par = par(mfcol = c(1,2))
plot(mod)
par(old.par)


