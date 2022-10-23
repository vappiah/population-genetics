library(qqman)

#set the working directory
setwd("/home/kobina/FST")

fst <- read.table("pop1_vs_pop2.weir.fst",sep='\t',header=TRUE)


#add snp column. 
#because this data does not include snp name, we will add dummy names.
#we do this by assigning a number to each snp.
length_ <- dim(fst)[1]
length_
fst$SNP <- paste('SNP',1:length_)

#generate the manhattan plot
manhattan(fst,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',
          logp=FALSE,ylab='WEIR AND COCKERHAM_FST',xlab='CHR')


#change the colors of the plot
manhattan(fst,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "red"),
          logp=FALSE,ylab='WEIR AND COCKERHAM_FST',xlab='CHR')


#change the colors of the plot
manhattan(fst,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("blue", "orange"),
          logp=FALSE,ylab='WEIR AND COCKERHAM_FST',xlab='CHR')


#we can also annotate SNPs based on their fst values. 
#we do that by specifying a threshold using the annotatePval parameter
#by default, qqman only annotates the top SNP per chromosome that exceeds the threshold.
#lets use an fst threshold of 0.2
manhattan(fst,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "red"),
          logp=FALSE,annotatePval = 0.2)

#annotate snps with fst values 0.7
manhattan(fst,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "red"),
          logp=FALSE,annotatePval = 0.7,annotateTop = TRUE)

#highlight all hits. 
#to do that, we change the annotateTop parameter to False
manhattan(fst,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "red"),
          logp=FALSE,annotatePval = 0.7,annotateTop = F)

#let's add a genomewide line.
manhattan(fst,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "red"),
          suggestiveline = F,genomewideline = 0.5,logp=FALSE,ylab='WEIR AND COCKERHAM_FST',xlab='CHR')


#highlight snp(s) of interest
snps_of_interest=c("SNP 1422","SNP 20367","SNP 7412")
manhattan(fst,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "red"),
          logp=FALSE,ylab='WEIR AND COCKERHAM_FST',xlab='CHR',highlight=snps_of_interest)

