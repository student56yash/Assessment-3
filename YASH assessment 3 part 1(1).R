# Downlod the data file of "gene_expression.tsv"
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",destfile="gene_expression.tsv")

# Read into R
x<-read.table("gene_expression.tsv")
# Lets check if the data has been imported properly
head(x)
str(x)

# Making the gene accession numbers the row names
x <- read.table("gene_expression.tsv", header = TRUE , stringsAsFactors = FALSE , row.names = 1, sep="\t")
head(x)
str(x)

# Making new column which is mean of others 
x$Mean<- rowMeans(x)
head(x)

#list 10 genes with the highest mean expression
head(ord<-x[order(-x$Mean),],n=10)

# Number of genes with mean<10
which(B<-rowMeans(x)<10)
#(42124+1573)=43,697

#histogram plot of mean values
hist(x$Mean,breaks = 20,xlab="Genes",ylab="Mean",main="Mean values of the RNA sequency",col="green",border = "brown")
#save histogram in png format
png(file="Assessment part 1 first section histogram.png")
hist(x$Mean,breaks = 20,xlab="Genes",ylab="Mean",main="Mean values of the RNA sequency",col="green",border = "brown")
dev.off()
