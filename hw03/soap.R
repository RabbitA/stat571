approx = function (df) {
  a = nrow(df)
  b = ncol(df)
  for (i in 1:a) {
    yi = df[1,] 
  }
}

full = read.csv("~/work/stat571/hw03/4.3.dat")
df = read.csv("~/work/stat571/hw03/4.20.dat")
df

a = nrow(df)
b = ncol(df)
for (i in 1:a) {
  yi = df[1,] 
  print(paste("i = ", i))
  print(yi)
}
