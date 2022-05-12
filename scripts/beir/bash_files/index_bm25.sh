#mkdir -p indexes

#for corpora in arguana bioasq climate-fever dbpedia-entity fever hotpotqa nfcorpus quora robust04 scidocs scifact signal1m trec-covid trec-news webis-touche2020 fiqa nq

#for corpora in android  english  gaming  gis  mathematica  physics  programmers  stats  tex  unix  webmasters  wordpress
# BeirFlatCollection
for chunk in train eval dev
do
for corpora in msmarco
#for corpora in cqadupstack
do
python -m pyserini.index -collection JsonCollection -generator DefaultLuceneDocumentGenerator \
-threads 20 -input /store/scratch/y247xie/00_data/wp-tokenized-anserini/${corpora}/queries/${chunk} \
	-index indexes/queries/lucene-index-beir-queires-${corpora}-${chunk} -storePositions -storeDocvectors -storeRaw -pretokenized
done
done
