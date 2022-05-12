for set_mode in c2c
do
for metric in weight_jaccard js_divergence tf_filter df_filter kl_divergence
#for metric in kl_divergence
do
python compare_domains.py \
    --index_path indexes/ \
    --output_path similarities/${set_mode}_${metric}.tsv \
    --compare_sets ${set_mode} \
    --compare_metric ${metric}
done
done
