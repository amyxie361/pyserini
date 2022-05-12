#for metric in weight_jaccard kl_divergence tf_filter df_filter
#for metric in js_divergence
for metric in weight_jaccard
do
python compare_domains.py \
    --index_path indexes \
    --output_path indexes_${metric}.tsv \
    --compare_metric ${metric}
done
