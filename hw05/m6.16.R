library(R.utils)

# two replications of A, B, C, D
vars = c("A","B","C","D")
levels = c(-1, 1)
reps = matrix( 
  c(7.037, 14.707, 11.635, 17.273, 10.403, 4.368, 9.360, 13.440, 
    8.561, 16.867, 13.876, 19.824, 11.846, 6.125, 11.190, 15.653,
    6.376, 15.219, 12.089, 17.815, 10.151, 4.098, 9.253, 12.923, 
    8.951, 17.052, 13.658, 19.639, 12.337, 5.904, 10.935, 15.053),
  ncol=2
) 
Total <- apply(reps,1,sum)
exp = expand.grid(A=levels, B=levels, C=levels, D=levels)

# create a data frame by binding the observations to the exp design
df = data.frame(rbind(cbind(exp, r=reps[,1]), cbind(exp, r=reps[,2])))

lmod = lm(r ~ A + B + D + A*B, df)
summary(lmod)
coefficients(lmod)
cor.test(A, B, D))

library(lattice)
model.one = function (x, y) {
  10.19006 - (0.498 * x) + (1.988 * y)
}
model.zero = function (x, y) {
  11.98806 + (1.509 * x) + (1.988 * y)
}

a = seq(-1, 1, 0.1)
b = seq(-1, 1, 0.1)

par(mfcol=c(1,2))
z.one = outer(a, b, model.one)
contour(a, b, z.one, main="Contour c=1", xlab="temp", ylab="Ti")
z.zero = outer(a, b, model.zero)
contour(a, b, z.zero, main="Contour c=0", xlab="temp", ylab="Ti")

