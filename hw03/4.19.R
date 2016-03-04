tip = factor(c(rep(1,4), rep(2,4), rep(3, 4), rep(4,4)))
coupon = factor(1:4)
response = c(9.3, 9.4, 9.2, 9.7, 
             9.4, 9.3, 9.4, 9.6, 
             9.6, 9.6, 9.5, 10.0,
             10.0, 9.9, 9.7, 10.2)
df = data.frame(tip, coupon, response)
matrix(df$response, 4, 4)
amod = aov(response ~ tip + coupon, data=df)
summary(amod)

plot(residuals(lm(response ~ tip + coupon, data=df)))
abline(0, 0, col='blue')

plot(residuals(lm(response ~ coupon, data=df)))
plot(df$tip, df$response, type="p")

# Fisher LSD
library(agricolae)
lsd1 = LSD.test(amod, "tip")
lsd2 = LSD.test(amod, "coupon")
df$ab <- with(df, interaction(df$tip, df$coupon)) 
comp3 <- HSD.test(,"ab") 


require(multcomp) 
tuk <- glht(amod, linfct = mcp(tip="Tukey"))
summary(tuk)
tuk.cld <- cld(tuk)
plot(tuk.cld)

df$ab <- with(df, interaction(df$tip, df$coupon)) 
xi.aov <- aov(response ~ ab, data=df) 
summary(xi.aov) 
xi.glht <- glht(xi.aov, linfct=mcp(ab="Tukey")) 
xi.cld <- cld(tuk)
plot(xi.cld)
confint(xi.glht)

## graphs 
## boxplots 
require(lattice) 
bwplot(response ~ ab, data=df)
plot(xi.glht)
