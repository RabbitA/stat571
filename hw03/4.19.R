tip = factor(c(rep(1,4), rep(2,4), rep(3, 4), rep(4,4)))
coupon = factor(1:4)
response = c(9.3, 9.4, 9.2, 9.7, 
             9.4, 9.3, 9.4, 9.6, 
             9.6, 9.31, 9.5, 10.0,
             10.0, 9.9, 9.7, 10.2)
df = data.frame(tip, coupon, response)
matrix(df$response, 4, 4)
amod = aov(response ~ tip + coupon, data=df)
summary(amod)
