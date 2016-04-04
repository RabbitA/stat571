library(R.utils)

# two replications of A, B, C, D
vars = c("A","B","C","D")
levels = c("L", "H")
reps = list( 
  c(7.037, 14.707, 11.635, 17.273, 10.403, 4.368, 9.360, 13.440, 
       8.561, 16.867, 13.876, 19.824, 11.846, 6.125, 11.190, 15.653),
  c(6.376, 15.219, 12.089, 17.815, 10.151, 4.098, 9.253, 12.923, 
       8.951, 17.052, 13.658, 19.639, 12.337, 5.904, 10.935, 15.053)
)
Total <- lapply(reps,sum)
exp = expand.grid(A=levels, B=levels, C=levels, D=levels)

# create a data frame by binding the observations to the exp design
dat = data.frame()
for (r in reps) {
  dat = rbind(dat, cbind(as.data.frame(exp), r=r))
}

# use Tukey's test to find main effects
amod = aov(r ~ A * B * C * D, dat)
for (f in vars) {
  tukey = TukeyHSD(amod, which=f)
  printf("%s = %s\n", f, unlist(tukey)[1])
}

# hand calculate the main effects
lowA = dat$A == "L"
lowB = dat$B == "L"
lowC = dat$C == "L"
lowD = dat$D == "L"
hiA = dat$A == "H"
hiB = dat$B == "H"
hiC = dat$C == "H"
hiD = dat$D == "H"

# estimate main effects
One = sum(dat[lowA & lowB & lowC & lowD, "r"])
a = sum(dat[hiA & lowB & lowC & lowD, "r"])
b = sum(dat[lowA & hiB & lowC & lowD, "r"])
c = sum(dat[lowA & lowB & hiC & lowD, "r"])
d = sum(dat[lowA & lowB & lowC & hiD, "r"])
ab = sum(dat[hiA & hiB & lowC & lowD, "r"])
ac = sum(dat[hiA & lowB & hiC & lowD, "r"])
ad = sum(dat[hiA & lowB & lowC & hiD, "r"])
bc = sum(dat[lowA & hiB & hiC & lowD, "r"])
bd = sum(dat[lowA & hiB & lowC & hiD, "r"])
cd = sum(dat[lowA & lowB & hiC & hiD, "r"])
abc = sum(dat[hiA & hiB & hiC & lowD, "r"])
acd = sum(dat[hiA & lowB & hiC & hiD, "r"])
abd = sum(dat[hiA & hiB & lowC & hiD, "r"])
bcd = sum(dat[lowA & hiB & hiC & hiD, "r"])
abcd = sum(dat[hiA & hiB & hiC & hiD, "r"])
n = 2 # replicates

A = (1/(8*n)) * (a + ab + ac + ad + abc + acd + abd + abcd 
                 - b - c - d - bc - bd - cd - bcd - One)
B = (1/(8*n)) * (b + ab + bc + bd + abc + abd + bcd + abcd 
                 -a - c - d - ac - ad - cd - acd - One)
C = (1/(8*n)) * (c + ac + bc + cd + abc + acd + bcd + abcd
                 - a - b - d - ab - ad - bd - abd - One)
D = (1/(8*n)) * (d + ad + bd + cd + acd + abd + bcd + abcd
                 - a - b - c - ab - ac - bc - abc - One)

printf("A = %s\n", A)
printf("B = %s\n", B)
printf("C = %s\n", C)
printf("D = %s\n", D)



# plot to find which effects are most significant
lmod = lm(r ~ A * B * C * D, dat)
summary(lmod)
plot(predict(lmod), resid(lmod))
abline(h=0)

qqplot(predict(amod), residuals(amod))
abline(predict(amod), residuals(amod))
summary(amod)

library("DoE.base")
library("FrF2")
MEPlot(amod)
IAPlot(amod)

mod = glm(r ~ A * B * C * D, data=dat)
