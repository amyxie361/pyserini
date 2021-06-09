python -m pyserini.eval.evaluate_dpr_retrieval_regression \
  --retrieval1 runs/run.dpr.nq-test.multi.bf.bm25.otf.json \
  --retrieval2 runs/run.dpr.nq-test.multi.bf.bm25.json \
  --output_file runs/dpr-single_dpr_nq_regress.pkl \
  --topk 1 5 10 20 100
