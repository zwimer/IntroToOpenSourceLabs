col_names <- names(binary)
df <- as.data.frame(binary)
binary.raw <- NULL
for(i in 1:4){
  binary.raw <- cbind(binary.raw, rep(as.character(df[,i])))
}
str(binary.raw)
binary.raw <- as.data.frame(binary.raw)
names(binary.raw) <- names(df)[1:4]
dim(binary.raw)
str(binary.raw)
summary(binary.raw)

library(arules)
rules.all <- apriori(binary.raw)
inspect(rules.all)
rules <- apriori(binary.raw, control = list(verbose=F), parameter = list(minlen=2, supp=0.075, conf=0.4))
inspect(rules)

plot(rules, method="grouped")
