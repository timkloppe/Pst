From YAHS log file:

1. Hi‑C data volume is fine: dumped 45951717 read pairs from 91903434 records: 36229706 intra links + 9722011 inter links
~46 M valid pairs, with ~36 M intra‑contig and ~9.7 M inter‑contig links is plenty for scaffolding a ~90-180Mb fungal genome ?

2. Contig N50 is small, and YAHS barely improves it.

Initial stats: N50: 2752958 (n = 16); Number bases: 137535334
After all rounds: N50: 2992830 (n = 15); N90: 34678 (n = 781); Number sequences: 1270

3. YAHS explicitly stops because the assembly is too fragmented -> N50 ~3 Mb → contigs are not long enough for Hi‑C to confidently span and order them into full chromosomes. -> I risk misjoins rather than real chromosome‑scale scaffolds ->

scaffolding round 6 resolution = 500000  
assembly N50 (2992830) too small. End of scaffolding.

4. 137 Mb total size suggests duplication, unpurged/misscollapsed haplotypes and repeats, which Hi-C cannot fix.- > YAHS can only order and orient reasonably long and correct contigs. SOLUTION: improve short messy contigs in the primary assembly using hifiasm with improvements(see README.md in hifiasm directory) so that YAHS can confidently scaffold  
