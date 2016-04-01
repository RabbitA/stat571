library(R.utils)

dat = read.csv("~/work/stat571/project/birthdays.csv")
birthdays = dat[-c(1)]
birthdays$Day = factor(birthdays$Day)

find_shared = function (df) {
  uniq = unique(df[, c("Month", "Day")])
  nfound = 0
  for (i in 1:nrow(uniq)) {
    uval = uniq[i,]
    n = nrow(df[ df$Month == uval$Month & df$Day == uval$Day, ])
    
    if (n > 1) {
      nfound = nfound + 1
    }
  }
  return(nfound)
}

replications = 10
for (sample.size in seq(5,nrow(birthdays),5)) {
  found = numeric(replications)
  for (i in 1:replications) {
    found[i] = find_shared(birthdays[sample(1:nrow(birthdays), sample.size, F), ])
  }
  
  if (all(found==0)) {
    printf("None found for sample size %s\n", sample.size)
  }
  
  for (n in sort(unique(found[found > 0]))) {
    printf("Sample size %s, %s found %s%%\n", 
           sample.size, 
           n, 
           sum(found==n)/length(found) * 100
           )
  }
}