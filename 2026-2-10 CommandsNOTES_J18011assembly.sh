
echo "1.3 check quality of hifi and ONT reads using Nanoplot"
echo "1.3.2 map FCS-GX cleaned HiFi and ONT reads to mitochondrial refseq and filter these out to seperate nuclear and mitochondrial (reads) assemblies"

# Nanoplot results of original reads, FCS-GX cleaned as well as mitochondrium-filtered reads were outsourced to excel table. Dotplots of read length versus read quality are available.
################################################################################################################################################################################################################################################################


echo "2. assembly using Hifiasm on Galaxy"

hifiasm -t ${GALAXY_SLOTS:-1} -o output -f 37 -k 51 -w 51 -D 5.0 -N 100 -r 3 --max-kocc 20000 --hg-size 90m --rl-cut 1000 --sc-cut 10 -a 4 -z 0 -m 10000000 -p 100000 -n 3 -x 0.8 -y 0.2   --dual-scaf --scaf-gap 3000000 --h1 './HiCF/input_0.fastqsanger.gz' --h2 './HiCR/input_0.fastqsanger.gz' --l-msjoin 500000 --ul './ultralong/input_0.fastqsanger' --ul-rate 0.1 --ul-tip 6 --primary input_0.fastqsanger

# generated files: 4 contig graphs, noseq-gfa files and gfa files for each primary,alernate, haplotype1 and 2, raw unitig.gfa, output.log file and bin files. More on different formats here: https://hifiasm.readthedocs.io/en/latest/interpreting-output.html
################################################################################################################################################################################################################################################################


echo "4. Scaffolding the assembly"
echo "4.1.1 align Hi-C reads to hifiasm assembly using bwa-mem2, ten merge, sort and filter reads for qulaity"

bwa-mem2 mem -t "${GALAXY_SLOTS:-1}" -v 1 'localref.fa' '/mnt/galaxy1/temp_share/tim.kloppe/RustHealth/1_fastq/results/1-j18_1535974/Hi-C/1-j18_1535975_S3HiC_R1.fastq.gz'  | samtools sort -n -@${GALAXY_SLOTS:-2} -T "${TMPDIR:-.}" -O bam -o '/mnt/galaxy2/rawfiles/000/311/dataset_311747.dat'

bellerophon --forward forward_input.bam --reverse reverse_input.bam --quality 20 --output 'merged_out.bam' --threads ${GALAXY_SLOTS:-1} && samtools sort --no-PG -O BAM -o '/mnt/galaxy2/rawfiles/000/311/dataset_311749.dat' -@ ${GALAXY_SLOTS:-1} merged_out.bam


echo "4.1.2 scaffold an assembly using YAHS"

yahs --no-mem-check input.fasta input.bam --no-contig-ec -o yahs_out 2> output.log

# generated files: final versions of fasta, agp and log file, but also round 1 -5 break.agp and output.gfa files
################################################################################################################################################################################################################################################################

echo "3. Assembly-QC"
echo "3.2 Assembly-QC using quast"
echo "3.3 Assembly-QC using BUSCO in compleasm"

# both quast and BUSCO results were outsourced to excel table
################################################################################################################################################################################################################################################################
