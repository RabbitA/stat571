hours <- c(159, 280, 101, 212, 224, 379, 179, 264, 222, 362, 168, 250, 149, 260, 485, 170)
hours.mean <- mean(hours)
hours.mean
hours.sd <- sd(hours)
hours.sd

t.test(hours, alternative = "g", conf.level = .05)
t.test(hours)

bp <- c(128, 127, 118, 115, 144, 142, 133, 140, 132, 131, 111, 132, 149, 122, 139, 119, 136, 129, 126, 128)
t.test(bp)
sd(bp)