# popcorn
dat.dir = "~/work/stat571/project"
dat = read.csv(file.path(dat.dir, "popcorn.csv"))
dat$power = factor(dat$power)

mod = aov(y ~ additive + power, dat)
options(show.signif.stars=FALSE)
summary(mod)

old.par = par(mfcol = c(1,2))
plot(mod)
par(old.par)


