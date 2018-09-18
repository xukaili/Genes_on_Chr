args = commandArgs(trailingOnly=TRUE)
chromosome <- read.table(args[1], header = F,sep = '\t')
chr = chromosome[,1]
new = c(max(chr)+1,1)
chromosome <- rbind(chromosome, new)
genes <- read.table(args[2], header = F,sep = '\t')
genes = genes[order(genes$V1,genes$V2),]

Site=function(position,position2,name,chrs){
  h1 =0.5
  h2 =0.5
  h  =1.5
  hh1=1.5
    if(position==position2){
      segments(hh1+chrs,position,hh1+chrs+h, position)
    }
    else{
      segments(hh1+chrs,position,hh1+chrs+h1,position)
      segments(hh1+chrs+h-h2,position2,hh1+chrs+h,position2)
      segments(hh1+chrs+h1,position,hh1+chrs+h-h2,position2,col="black")
    }
    text(hh1+chrs+h+0.1,position2,name,adj=c(0,0.5),cex=0.6,col="black")
}
Change=function(genes_pos,genes_name){
  dec=1.8*max(size)/100
  position2=1:length(genes_pos)
  position2[1]=genes_pos[1]
  if(length(genes_pos)>1){
    for(i in 2:length(genes_pos)){
      if (genes_pos[i]-genes_pos[i-1]<=dec){
        if(genes_pos[i]!=genes_pos[i-1]){  
          position2[i] =position2[i-1]+dec
        }
        else{
          position2[i]=position2[i-1]
        }
      }
      else{
        position2[i] = genes_pos[i]
      }
    }
  }      
  return(position2)    
}
format_Y <- function(x) {
    limits <- c(1e-24, 1e-21, 1e-18, 1e-15, 1e-12, 1e-9, 1e-6, 1e-3, 1e0, 1e3, 1e6, 1e9, 1e12, 1e15, 1e18, 1e21, 1e24)
    prefix <- c("y", "z", "a", "f", "p", "n", "µ", "m", " ", "k", "M", "G", "T", "P", "E", "Z", "Y")
    i <- findInterval(abs(x), limits)
    i <- ifelse(i==0, which(limits == 1e0), i)
    return(limits[i])
}
main_Y <- function(x) {
    limits <- c(1e-24, 1e-21, 1e-18, 1e-15, 1e-12, 1e-9, 1e-6, 1e-3, 1e0, 1e3, 1e6, 1e9, 1e12, 1e15, 1e18, 1e21, 1e24)
    prefix <- c("y", "z", "a", "f", "p", "n", "µ", "m", "bp", "kb", "Mb", "Gb", "Tb", "Pb", "Eb", "Zb", "Yb")
    i <- findInterval(abs(x), limits)
    i <- ifelse(i==0, which(limits == 1e0), i)
    return(prefix[i])
}

denominator = format_Y(max(chromosome[,2]))
mainY = main_Y(max(chromosome[,2]))
chromosome = cbind(chromosome[,1],chromosome[,2]/denominator)
genes = cbind (genes[,1],genes[,2]/denominator, as.data.frame(genes[,3]))
size = chromosome[,2]
chr = chromosome[,1]

pdf("Genes_on_Chr_plot.pdf",(max(chr)+4),7)
pp = barplot(size, space = max(chr), border=NA, ylab = paste(mainY,"in length"), col=c(rep("gray",max(chr)-1),"white"))
axis(1,at=pp,c(paste("Chr",1:(max(chr)-1),sep = ""),""),tick = FALSE, col.axis="black")
for (k in 1:max(chr)) {
    position2=Change(genes[which(genes[,1] %in% c(k)),][,2],genes[which(genes[,1] %in% c(k)),][,3])
    print(position2)
    print(genes[which(genes[,1] %in% c(k)),][,2])
    for(i in 1: nrow(genes[which(genes[,1] %in% c(k)),])){
        Site(position=as.numeric(genes[which(genes[,1] %in% c(k)),][i,2]),position2=position2[i],name=as.character(genes[which(genes[,1] %in% c(k)),][i,3]),chrs=((genes[which(genes[,1] %in% c(k)),][i,1] - 1 )*(max(chr) + 1) + (max(chr) -1 )))
    }
}
dev.off()
