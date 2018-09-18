# Genes_on_Chr
Extract detail information from Genes_on_Chr.R
![image](https://github.com/xukaili/Genes_on_Chr/blob/master/Genes_on_Chr_plot.png)

# Description
The Genes_on_Chr.R can be used to draw the corresponding genes on chromosome map quickly in PDF format based on the input data. It will become a useful tool for drawing genes on chromosome map with the advantages of simple input data format, easily modified output and very good portability.</br></br>

# Dependencies
All R versions</br></br>

# Getting started
Put Genes_on_Chr.R and data files in a same dir, then run:</br></br>
>  Rscript  Genes_on_Chr.R  chr.txt  gene.txt</br>
</br>

# Contact information
If you do not have the data files:</br>
1. Get chr.txt form genome.fa:</br></br>
>  perl -e '$/ = ">"; while (<>) {($head,$seq) = split(/\n/,$_,2); $len = length $seq; $head =~ /(\d+)/; print "$1\t$len\n";}'  genome.fa > chr.txt</br>
</br>

2. Get gene.txt form genome.gff:</br></br>
>  perl    Search.pl    list.txt    GFF3.gff    >    gene.txt</br>
</br>

# Contact information
For any questions please contact xukai_li@qq.com</br>
