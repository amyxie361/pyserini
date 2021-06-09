python -m pyserini.dsearch \
  --topics dpr-nq-test \
  --index wikipedia-dpr-multi-bf \
  --encoded-queries dpr_multi-nq-test \
  --output runs/run.dpr.nq-test.multi.bf.trec \
  --batch-size 36 --threads 12

