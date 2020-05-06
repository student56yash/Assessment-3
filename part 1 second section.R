# Downlod the data file of "growth_data.csv"
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",destfile="growth_data.csv")

# Read into R
y<-read.csv("growth_data.csv")

# Lets check data type and if the data has been imported properly
head(y)
str(y)

y <- read.csv("growth_data.csv", header=TRUE, sep="," ,stringsAsFactors = TRUE)
head(y)

#column names of data set
colnames(y)

#Mean and Standrd deveation of tree circumference in both sites at start(2014)
NE1<-y[1:50,3]
NE1
mean(NE1)
sd(NE1)

SW1<-y[51:100,3]
SW1
mean(SW1)
sd(SW1)

#Mean and Standrd deveation of tree circumference in both sites at end(2019)
NE2<-y[1:50,6]
NE2
mean(NE2)
sd(NE2)

SW2<-y[51:100,6]
SW2
mean(SW2)
sd(SW2)

#box plot of tree circumference at start and end of the both sites
boxplot(NE1,SW1)
boxplot(NE1,SW1,xlab="North East & South West Sites",ylab="Circumferences",main="Tree Circumference of both sites at the start (2014)",names=c("NE1","SW1"),col=c("blue","green"),border = "brown",ntch=TRUE)
boxplot(NE1,SW1,xlab="North East & South West Sites",ylab="Circumferences",main="Tree Circumference of both sites at the start (2014)",names=c("NE1","SW1"),col=c("blue","green"),border = "brown",ntch=TRUE)

boxplot(NE2,SW2)
boxplot(NE2,SW2,xlab="North East & South West Sites",ylab="Circumferences",main="Tree Circumference of both sites at the end (2019)",names=c("NE2","SW2"),col=c("blue","green"),border = "brown",ntch= TRUE)


boxplot(NE1,SW1,NE2,SW2)
boxplot(NE1,SW1,NE2,SW2,xlab="North East & South West Sites",ylab="Circumferences",names=c("NE1","SW1","NE2","SW2"), main="Tree Circumference of both sites at the start and end",las=2,col=c("blue","green"),border = "brown",ntch=TRUE)

#save charts to a file
pdf("Assessment part 1 second section plots.pdf")
boxplot(NE1,SW1,xlab="North East & South West Sites",ylab="Circumferences",main="Tree Circumference of both sites at the start (2014)",names=c("NE1","SW1"),col=c("blue","green"),border = "brown",ntch=TRUE)
boxplot(NE2,SW2,xlab="North East & South West Sites",ylab="Circumferences",main="Tree Circumference of both sites at the end (2019)",names=c("NE2","SW2"),col=c("blue","green"),border = "brown",ntch= TRUE)
boxplot(NE1,SW1,NE2,SW2,xlab="North East & South West Sites",ylab="Circumferences",names=c("NE1","SW1","NE2","SW2"), main="Tree Circumference of both sites at the start and end",las=2,col=c("blue","green"),border = "brown",ntch=TRUE)
dev.off()

# Mean growth of past 10 yeras
a<-y[1:50,][4:6]
a






