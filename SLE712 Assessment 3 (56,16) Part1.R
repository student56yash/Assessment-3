---
title: SLE712 Assessment 3- Part 1- Importing files, data wrangling, mathematical
  operations, plots and saving code on GitHub
authour: Yasodha Suharshi Jayawardena & Dhanusha Weerawardana
output:
  pdf_document: default
  html_document: default
  word_document: default
Theam: cosmo
---

GitHub repository: https://github.com/student56yash/Assessment-3-part-1.git

## Introduction
Rstudio is a programming language which is appliable for projects on statisticals computing and graphics. Furthermore, the software was initially started on the year 2009 and according to Rstudio, their mission is to "create free and open-source software for data science, scientific research, and technical communication" with the hope of enhance production quality. 

However, during Assessment 3 part 1, bioinformatics knowladge will be improve due to many activities on Rstudio software, licuding importing files, data wrangling, mathematical operations,
  plots and saving code on GitHub.

## Question No:1-Download the file and read into the R studio.
Here we use "gene_expression.tsv" file that contains RNA-seq count data for two sample of interest.   
In order to download the file by the comand `download.file` and then to import data into the R and cread data according to a format, respectivly `header = TRUE` (if the file has headings) and `row.name = 1` commands can be applied. Finally, `head()` and `str()` commands can be used to check if the data is improt properly and also check the stucture of the data.

```{r,chunk1,echo=TRUE}
#Downlod the data file of "gene_expression.tsv"
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",destfile="gene_expression.tsv")
#Read into R as x
x <- read.table("gene_expression.tsv", header = TRUE , stringsAsFactors = FALSE , row.names = 1, sep="\t")
# Lets check if the data has been imported properly and a table of values for the first 6 genes
head(x)
str(x)
```


## Question No:2-Make a new column for mean of the other columns and present a table with first 6 values.
In this situation, `$` apply create a data farame and then `<-` operator used to assign a new vector of data to it. All in all the command should appear like `_$Mean<- rowMeans ()`. Finally `head()` can be used to obtain mean values of first 6 columns.

```{r,chunk2,echo=TRUE}
#Create new column which is mean of others
x$Mean<- rowMeans(x)
head(x)
```

## Question No:3-List the 10 genes with the highest mean expression.
in this question data has to be sort by giving command `order()` and the number of data can be determine by `n= required amount`. Altogteher the commanand should be `head(ord<-X[order(-X$Mean),],n=10)` and X is the data farme.

```{r,chunk3,echo=TRUE}
#10 genes with the higher mean values
head(ord<-x[order(-x$Mean),],n=10)
```

## Question No:4-Determine the number of genes with a mean <10.
In order to obtain the mean value of above 10 genes, `which()` fuction can be used. To illustrate, in a logical vector `which()` fuction able to return the posion of true element.Thereby, the B is new data set(mean value above 10) and the data frame is `rowMean` of X.

```{r,chunk4,echo=TRUE}
#Number of gene with the mean value above 10
which(B<-rowMeans(x)<10)
```

## Question 5-Make a histogram plot of the mean values in png format.
In this question, plot a histogram for mean values and saved as in png format. Therefore, first `hist` command can be used to creat a histogram and `x$Mean` is the data frame. Secondly, `xlab` and `ylab` functions can be used to leble the x and y axis and finally in order to make the histogram clear, colors for border and columns can be apply.

To save the hitogram in to the R database, `png(location)` function can be used as the command for the format.

```{r,chunk5,echo=TRUE}
#Histogram plot of mean value 
hist(x$Mean,breaks = 20,xlab="Genes",ylab="Mean",main="Mean values of the RNA sequency",col="green",border = "brown")
#save histogram in png format
png(file="Assessment part 1 first section histogram.png")
hist(x$Mean,breaks = 20,xlab="Genes",ylab="Mean",main="Mean values of the RNA sequency",col="green",border = "brown")
dev.off()
```


## Question No:6-Import csv file into R and identify column names
  Here we use "growth_data.csv" file that contains measurements for tree circumference growing at two sites, control site and treatment site which were planted 20 years ago. Firstly, `download.file()` command use to obtain the dataset and then read into R as `read.csv`. It is important to set `header=TRUE` if the data file has headings, and `stringAsFactors=FALSE` if the table contains data in strings. Lastly, check if csv file is imported properly.
```{r,chunk6, echo=TRUE}
# Downlod the data file of "growth_data.csv"
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",destfile="growth_data.csv")
# Read into R
y <- read.csv("growth_data.csv", header=TRUE, sep="," ,stringsAsFactors = FALSE)
# Lets check if the data has been imported properly
head(y)
str(y)
```
### Colnames
```{r,chunk7,echo=TRUE}
#column names of data set
colnames(y)
```

## Question No:7-Calculate tree circumference and standrad deviation at start and end of 2 sites
The file "growth_data.csv" containes two sites (northeast and southwest). So, here we use `subset` command to subset different tree circumference and read "northeast" and "southwest" sites as NE and SW respectively. Use `head` command to check if they imported properly.
```{r,chunk8,echo=TRUE}
#Seperate tree circumference in both sites
NE<-subset(y,Site=="northeast")
SW<-subset(y,Site=="southwest")
head(NE)
head(SW)
```

The mean and standard deviation of tree circumference is calculating with `mean` and `sd` commands at start (2004) and end of the study (2019) in both sites.
```{r,chunk9,echo=TRUE}
#Mean of tree circumference in northeast site at start(2004)
mean(NE$Circumf_2004_cm)
#Standard deviation of tree circumference in northeast site at start(2004)
sd(NE$Circumf_2004_cm)
#Mean of tree circumference in southwest site at start(2004)
mean(SW$Circumf_2004_cm)
#Standard deviation of tree circumference in southwest at start(2004)
sd(SW$Circumf_2004_cm)
#Mean of tree circumference in northeast site at end(2019)
mean(NE$Circumf_2019_cm)
#Standard deviation of tree circumference in northeast site at end(2019)
sd(NE$Circumf_2019_cm)
#Mean of tree circumference in southwest site at end(2019)
mean(SW$Circumf_2019_cm)
#Standard deviation of tree circumference in southwest site at end(2019)
sd(SW$Circumf_2019_cm)
```

## Question No:8-Make boxplot of tree circumference 
Create boxplot of Circumference (cm) at the start(2004) and end (2019) of the both sites.
```{r, chunk10,echo=TRUE}
boxplot(NE$Circumf_2004_cm,NE$Circumf_2019_cm,SW$Circumf_2004_cm,SW$Circumf_2019_cm,ylab="Circumference(cm)",names=c("NE2004","SW2004","NE2019","SW2019"), main="Growth of Two Plantation Sites",las=2,col=c("yellow","blue"),border = "red",ntch=TRUE)
```

## Question No:9-calculate mean growth over the past 10 years
Here make a new column with mean growth over the past 10 years at each site and use `head` command to look at the first 6 lines of the dataframe.
```{r,chunk11,echo=TRUE}
# Mean growth of past 10 yeras at noetheast site
NE$growth<-NE$Circumf_2019_cm-NE$Circumf_2009_cm
head(NE)
# Mean growth of past 10 yeras at southwest site
SW$growth<-SW$Circumf_2019_cm-SW$Circumf_2009_cm
head(SW)
```
The plot shows that the meangrowth increase in circumference of noetheast site is close to 0 at strat and end, while the meangrowth circumference of southwest site i sclose to 40 and 60 at start and end respectively. So, based on that data it seems tree circumference of soutwest site is higher than northeast site at both start and end. 

## Question No:10-Use t.test and wilcox.test function to estimate p-value
t.test and wilcox.test use to determine wheather our finding is statistically significant. Here, the null hypothesis of the test is that there are no significant difference in the tree circumference between the two sites growth in past 10 years. Thus, the alternative hypothesis is that southeast site is assosiated with greater values of growth circumference than northeast site at past 10 yeras.

* t.test
p-value from t.test= 1.713e-06
```{r,chunk12,echo=TRUE}
#Use t.test to estimate the p-value for 10 years growth at 2 sites
t.test(SW$growth,NE$growth)
```

* wilcox.test
p-value from wilcox.test= 4.626e-06
```{r,chunk13,echo=TRUE}
#Use wilcox.test to estimate the p-value for 10 years growth at 2 sites
wilcox.test(SW$growth,NE$growth)
```

Since, both tests show the p-value is less than 5% significant level, this means we can reject the null hypothesis. So, we would be inclined to accept the alternative hypothesis, which states that tree growth of southwest site is higher than northeast site in past 10 yeras. Also, the p-value from two tests are slightly different with the reason of t.test is parametric and wilcox.test is  non-parametric. 

