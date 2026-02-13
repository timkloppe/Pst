1. peak_hom ≈ 288×, peak_het = -1 → hifiasm did not detect a clear heterozygous peak. With ~300× HiFi, the graph can also get unnecessarily dense; hifiasm generally behaves best around 30–60×. SOLUTION: Downsample HiFi reads to ~40–50×, apply filter for reads larger than 5kb but otherwise samples reads randomly. 

3. No heterozygous peak + no telomeres detected -> assembly is likely fragmented and haploid-collapsed.
[M::ha_pt_gen] peak_het: -1  
[M::gen_telo_end_t::] ==> # 5'-telomeres::0, # 3'-telomeres::0

4. Overlap stats: graph is huge and dense consistent with very high coverage → tangled graph, more chances for misjoins or over‑collapsed regions. SOLUTION: Downsample HiFi reads
# overlaps: 521430861  
# strong overlaps: 338904089  
# weak overlaps: 182526772

4. purge_dups is run multiple times. If over‑purging or missing content is suspected. SOLUTION: Try a run with less aggressive purging or even no purging.
