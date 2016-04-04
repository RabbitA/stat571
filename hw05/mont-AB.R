y = c(28,25,27,36,32,32,18,19,23,31,30,29)
k = length(y)
A.factor = gl(n=2, k=3, length=k, labels=c("L", "H"))
B.factor = gl(n=2, k=6, length=k, labels=c("L", "H"))

AB.factor = character(k)
for (i in 1:k) {
  AB.factor[i] = paste0(as.character(A.factor)[i], as.character(B.factor)[i])
}

df = data.frame(A=A.factor,B=B.factor,AB=AB.factor, y)
amod = aov(y ~ A * B, df)
#amod = aov(y ~ A.factor * B.factor)
summary(amod)

One = sum(df[df$A == "L" & df$B == "L", "y"])
a = sum(df[df$A == "H" & df$B == "L", "y"])
b = sum(df[df$A == "L" & df$B == "H", "y"])
ab = sum(df[df$A == "H" & df$B == "H", "y"])
n = 3 # replicates
A = (1/(2*n)) * (ab + a - b - One)
B = (1/(2*n)) * (ab + b - a - One)
AB = (1/(2*n)) * (ab + One - a - b)


int.amod = aov(y ~ A * B, df)
model.tables(int.amod)
TukeyHSD(amod, which="A")
