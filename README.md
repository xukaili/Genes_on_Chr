# Genes_on_Chr
Extract detailed information from __`Genes_on_Chr.R`__
![At](Genes_on_Chr_At.png)
![Os](Genes_on_Chr_Os.png)
## Description
__`Genes_on_Chr.R`__ can be used to draw the location of genes on chromosomes map quickly in `PDF` format based on the input data. It will become a useful tool for `drawing genes on chromosomes map` with the advantages of a simple input data format, easily modified output and very good portability. __`Genes_on_Chr.R`__ is open source, so all we ask is that you cite our most recent paper in any publications that use this script:</br>
> 基因基于R语言在染色体位置作图.</br>
> A tool to draw genes on chromosome based on R language.</br>


## Dependencies
All __`R`__ versions</br></br>

## Getting started
Put __`Genes_on_Chr.R`__ and data files in a same dir, then run:</br>
```
Rscript  Genes_on_Chr.R  chr.txt  gene.txt
```
</br>

The structure of __`chr.txt`__ (tab-delimited) data is: the first column is the __`chromosome number`__, and the second column is t信息学he __`base_pair of chromosome`__ (Length):</br>

```
1    Length_1
2    Length_2
3    Length_3
...  ...
```

</br>

The structure of __`gene.txt`__ (tab-delimited) data is: the first column is the __`chromosome number`__, the second column is __`location of the gene`__, and the third column is __`name of the gene`__:</br>
```
1    site_1       Gene_name_1
1    site_2       Gene_name_2
2    site_3       Gene_name_3
...   ...          ...
```
</br>

### If you do not have the data files
1. Get __`chr.txt`__ form __`genome.fa`__:</br>
```
perl -e '$/ = ">"; while (<>) {($head, $seq) = split (/\n/, $_, 2); $len = length $seq; $head =~ /(\d+)/; print "$1\t$len\n";}' genome.fa > chr.txt
```
</br>

2. Get __`gene.txt`__ form __`genome.gff`__:</br>
```
perl  Search.pl  list.txt  GFF3.gff  >  gene.txt
```
</br>

## Contact information
For any questions please contact xukai_li@qq.com</br>
