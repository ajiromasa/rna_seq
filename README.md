# count_and_tpm
# gene counting and TPM calculation
# 2025/03/06 Masahiko Ajiro

# sort by gene_ID
(head -n 1 gene_count_matrix.csv && tail -n +2 gene_count_matrix.csv| sort -k1,1) > gene_count_matrix_sorted.csv

# calculate gene counts
split_ids.awk gene_count_matrix_sorted.csv > gene_count_matrix_sorted.tsv 
countsum_by_symbol.awk gene_count_matrix_sorted.tsv > gene_count_matrix_sum.tsv

# calculate TPM
# calculate_TPM.R for TPM conversion
split_ids.awk TPM_matrix.csv > TPM_matrix.tsv 
countsum_by_symbol.awk TPM_matrix.tsv > TPM_matrix_sum.tsv
