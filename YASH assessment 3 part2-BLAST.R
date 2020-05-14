#libraries that we need
library("seqinr")
library("R.utils")
library("rBLAST")

#Download the E.coli gene sequency from the Ensemble FTP page
download.file("ftp://ftp.ensemblgenomes.org/pub/bacteria/release-42/fasta/bacteria_0_collection/escherichia_coli_str_k_12_substr_mg1655/cds/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz", destfile = "Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz")
#uncompress the file
gunzip("Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz",overwrite=TRUE)
#create a blast database
makeblastdb("Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz",dbtype = "nucl","-parse_seqids")

#Download sample file
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa", destfile = "sample.fa")
#Read file into R
s<-read.fasta("sample.fa")
myseq<-s[[56]]
myseq
str(myseq)

#calculate length
seqinr::getLength(myseq)
#calculate GC content
seqinr::GC(myseq)

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/mutblast_functions.R",destfile = "mutblast.R")
source("mutblast.R")

#test the function
res<-myblastn_tab(myseq = myseq,db= "Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa")
str(res)
head(res)

mysseqid<-as.character(res$sseqid)
mysseqid

db<-read.fasta("Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa")
str(db[1:3])

head(names(db))
myseqs<-db[which(names(db) %in% mysseqid)]
myseqs<-c(myseqs,myseq)
seqinr::write.fasta(myseqs,names=names(myseqs),file.out = "myseqs.fa")

