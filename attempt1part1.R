# Downlod the data file of "gene_expression.tsv"
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",destfile="gene_expression.tsv")

# Read into R
x<-read.table("gene_expression.tsv")
# Lets check data type and if the data has been imported properly
typeof(x)
head(x)
str(x)

# Making the gene accession numbers the row name
x <- read.table("gene_expression.tsv", header = TRUE)
head(x)
str(x)
x <- read.table("gene_expression.tsv", header = TRUE , stringsAsFactors = FALSE )
head(x)
str(x)
x <- read.table("gene_expression.tsv", header = TRUE , stringsAsFactors = FALSE , row.names = 1)
head(x)
str(x)

x <- read.csv("gene_expression.tsv", sep="\t" ,stringsAsFactors = FALSE, row.names = 1 )
head(x)
str(x)

#Make a new column which is the mean of other column
x$A <- colMeans(x)
x
colnames(x)[3]<-"Mean"
head(x)
str(x)

#need to fix ; list 10 genes with the highest mean expression
sort(A,decreasing=TRUE,n=10)

head(sort(df(a), decreasing=TRUE), n=10)

a <-colMeans(x)
sort(a,decreasing=TRUE,10)




