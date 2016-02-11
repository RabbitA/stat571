setwd("~/work/ecol596w")
df <- data.frame(read.csv("tensile.csv", header = F))
colnames(df) <- c("percent", "strength", "time")
  