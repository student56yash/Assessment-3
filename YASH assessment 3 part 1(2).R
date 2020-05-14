# Downlod the data file of "growth_data.csv"
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",destfile="growth_data.csv")

# Read into R
y<-read.csv("growth_data.csv")

# Lets check data type and if the data has been imported properly
head(y)
str(y)

y <- read.csv("growth_data.csv", header=TRUE, sep="," ,stringsAsFactors = FALSE)
head(y)

#column names of data set
colnames(y)

#Seperate tree circumference in both sites
NE<-subset(y,Site=="northeast")
SW<-subset(y,Site=="southwest")
head(NE)
head(SW)
#Mean and standard deviation of tree circumference in northeast site at start(2004)
mean(NE$Circumf_2004_cm)
sd(NE$Circumf_2004_cm)
#Mean and standard deviation of tree circumference in southwest site at start(2004)
mean(SW$Circumf_2004_cm)
sd(SW$Circumf_2004_cm)
#Mean and standard deviation of tree circumference in northeast site at end(2019)
mean(NE$Circumf_2019_cm)
sd(NE$Circumf_2019_cm)
#Mean and standard deviation of tree circumference in southwest site at end(2019)
mean(SW$Circumf_2019_cm)
sd(SW$Circumf_2019_cm)

boxplot(NE$Circumf_2004_cm,NE$Circumf_2019_cm,SW$Circumf_2004_cm,SW$Circumf_2019_cm)
boxplot(NE$Circumf_2004_cm,NE$Circumf_2019_cm,SW$Circumf_2004_cm,SW$Circumf_2019_cm,ylab="Circumference(cm)",names=c("NE2004","SW2004","NE2019","SW2019"), main="Growth of Two Plantation Sites",las=2,col=c("yellow","blue"),border = "red",ntch=TRUE)

#save boxplot
png(file="Assessment part 1 second section boxplots.png")
boxplot(NE$Circumf_2004_cm,NE$Circumf_2019_cm,SW$Circumf_2004_cm,SW$Circumf_2019_cm,ylab="Circumference(cm)",names=c("NE2004","SW2004","NE2019","SW2019"), main="Growth of Two Plantation Sites",las=2,col=c("yellow","blue"),border = "red",ntch=TRUE)
dev.off()

# Mean growth of past 10 yeras
NE$growth<-NE$Circumf_2019_cm-NE$Circumf_2009_cm
head(NE)

SW$growth<-SW$Circumf_2019_cm-SW$Circumf_2009_cm
head(SW)

t.test(SW$growth,NE$growth)
wilcox.test(SW$growth,NE$growth)

#Use t.test to estimate the p-value for 10 years growth at 2 sites
t.test(MeangrowthSW,NE=NULL,mu=0,alternative =c("two.sided","greater"),paired = FALSE,var.equal = FALSE,conf.level = 0.95)



