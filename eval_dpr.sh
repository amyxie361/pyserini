python -m pyserini.eval.convert_trec_run_to_dpr_retrieval_run \
  --topics dpr-nq-test \
  --index wikipedia-dpr \
  --input runs/run.dpr.nq-test.multi.bf.trec \
  --output runs/run.dpr.nq-test.multi.bf.json

python -m pyserini.eval.evaluate_dpr_retrieval \
  --retrieval runs/run.dpr.nq-test.multi.bf.json \
  --topk 20 100
