library(FrF2)
plan.annotated = FrF2(16, 6, factor.names = list(
  DieOrif = c(2.093, 2.1448), PistDiam = c(9.462, 9.5),
  Temp = c(188.1, 191.1), DieClean = c("Dirty", "Clean"),
  SMass = c(4, 8), BarClean = c("Dirty", "Clean")),
  seed = 6285)
MI <- c(35.77, 35.03, 38.5, 39.33, 35.7, 35.1, 39.27, 37, 41.07, 32.03,
        42, 37.63, 40.2, 37, 40.1, 35.03)
plan.resp <- add.response(plan.annotated, MI)

summary(plan.resp)
summary(lm(plan.resp))
