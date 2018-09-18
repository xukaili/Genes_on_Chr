# Genes_on_Chr
Extract detail information from __`Genes_on_Chr.R`__
![At](Genes_on_Chr_At.png)
![Os](Genes_on_Chr_Os.png)
## Description
The __`Genes_on_Chr.R`__ can be used to draw the corresponding genes on chromosome map quickly in `PDF` format based on the input data. It will become a useful tool for `drawing genes on chromosome map` with the advantages of simple input data format, easily modified output and very good portability.</br></br>

## Dependencies
All __`R`__ versions</br></br>

## Getting started
Put __`Genes_on_Chr.R`__ and data files in a same dir, then run:</br>
```
Rscript  Genes_on_Chr.R  chr.txt  gene.txt
```
</br>

## Contact information
If you do not have the data files:</br>
1. Get __`chr.txt`__ form __`genome.fa`__:</br>
```
perl -e '$/ = ">"; whil e(<>) {($head,$seq) = split (/\n/,$_,2); $len = length $seq; $head =~ /(\d+)/; print "$1\t$len\n";}' genome.fa > chr.txt
```
</br>

2. Get __`gene.txt`__ form __`genome.gff`__:</br>
```
perl  Search.pl  list.txt  GFF3.gff  >  gene.txt
```
</br>

## Contact information
For any questions please contact xukai_li@qq.com</br>
