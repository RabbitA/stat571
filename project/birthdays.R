library(R.utils)

dat = read.csv("~/work/stat571/project/birthdays.csv")
birthdays = dat[-c(1)]
birthdays$Day = factor(birthdays$Day)
uniq = unique(birthdays[, c("Month", "Day")])

nfound = 0
for (i in 1:nrow(uniq)) {
  uval = uniq[i,]
  n = nrow(birthdays[ birthdays$Month == uval$Month & birthdays$Day == uval$Day, ])
  
  if (n > 1) {
    printf("There are %s birthdays on %s %s\n", n, uval$Month, uval$Day)
    nfound = nfound + 1
  }
}

printf("In %s samples, we found %s shared birthdays.", nrow(birthdays), nfound)
