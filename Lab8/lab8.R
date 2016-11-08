#Is this a comment?
#Yup
#Begin
binary <- read.csv("~/Desktop/wd/binary.csv")
col_names <- names(binary)
df <- as.data.frame(binary)
head(binary)

myinfo.raw <- NULL
for(i in 1:4) { myinfo.raw <- cbind(myinfo.raw, rep(as.character(df[,i]),df$Freq))}
Error in rep(as.character(df[, i]), df$Freq) : invalid 'times' argument
#Oh, we have no Freq, redo
for(i in 1:4) { myinfo.raw <- cbind(myinfo.raw, rep(as.character(df[,i])))}

#Really just copying from the book at this point...
str(myinfo.raw)
myinfo.raw <- as.data.frame(myinfo.raw)
names(myinfo.raw) <- names(df)[1:4]
dim(myinfo.raw)
str(myinfo.raw)

summary(myinfo.raw)

#Done creating/formatting myinfo I believe
library(arules)

rules.all <- apriori(myinfo.raw)
inspect(rules.all)
rules.all
rules <- apriori(myinfo.raw, control = list(verbose=F), parameter = list(minlen=2, supp=0.005, conf=0.8))
#Not sure if I will need to change supp and conf
inspect(rules)

#Too many rules...
#Try with different numbers:
#Confidence min must be low enough to show actual trends. Otherwise some important trends wouldn't show up because of sample size issues.
rules <- apriori(myinfo.raw, control = list(verbose=F), parameter = list(minlen=2, supp=0.075, conf=0.4))

inspect(rules)
#Seems better...

quality(rules) <- round(quality(rules), digits=3)
rules.sorted <- sort(rules, by="lift")

#Find redundencies
subset.matrix <- is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1
which(redundant)

#Remove redundencies
rules.pruned <- rules.sorted[!redundant]
inspect(rules.pruned)

#Graph
library(arulesViz)
plot(rules.all)

#Graph but this time graph the CORRECT item: rules.pruned
plot(rules.pruned)
plot(rules.pruned, method="graph")
plot(rules.pruned, method="grouped")

