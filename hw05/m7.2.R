reps = data.frame(
  r1 = c(18.2, 27.2, 15.9, 41.0), r2 = c(18.9, 24.0, 14.5, 43.9),
  r3 = c(12.9, 22.4, 15.1, 36.3), r4 = c(14.4, 22.5, 14.2, 39.9))
levels = factor(c("low","high")) #c(-1, 1))
exp = expand.grid(A=levels, B=levels)
df = data.frame(rbind(
  cbind(exp, r=reps$r1, block="I"),   cbind(exp, r=reps$r2, block="II"),
  cbind(exp, r=reps$r3, block="III"), cbind(exp, r=reps$r4, block="IV")
))
options(show.signif.stars=FALSE)
summary(aov(r ~ block + A * B, df))

lmod = aov(r ~ block + A * B, df)
wireframe(r ~ block + A * B, df)

amod = aov(lmod.block)
summary(amod)
model.tables(amod)

par(mfcol=c(1,2))
qqnorm(resid(lmod.block))
qqline(resid(lmod.block), col="red")
plot(predict(lmod.block), resid(lmod.block), main="Pred v Res")
abline(h=0, col="red")
#plot(lmod.block)


summary(lmod.block)



library("FrF2")
MEPlot(lmod.block)
IAPlot(lmod.block, response="r")


df$Bit = factor(df$A, levels=c(-1,1), labels=c("low","high"))
df$Speed = factor(df$B, levels=c(-1,1), labels=c("low","high"))

par(mfrow=c(1,2),oma=c(0,0,2,0))
with(df, interaction.plot(x.factor=Bit, trace.factor=Speed, response=r, type="l", legend=T))
with(df, interaction.plot(x.factor=Speed, trace.factor=Bit, response=r, type="l", legend=T))
title("Interaction Plot", outer=T)

coplot(r ~ Bit|Speed, df, panel=panel.smooth, 
       ylab="Vibration",
       xlab="Bit Size")



lmod.noblock = aov(r ~ A * B, df)
#plot(lmod.noblock)
amod.noblock = aov(lmod.noblock)
IAPlot(amod.noblock)
MEPlot(amod.noblock)
