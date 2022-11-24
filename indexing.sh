#!/bin/bash

DEVICES=1,3
MODEL_FILE=/data/hanseok/law/statutes-ret-bert-multi/dpr_biencoder_bert_multi.0 #/data/hanseok/law/fact-ret-bert-multi/dpr_biencoder_bert_multi.36
# $MODEL_FILE #
# CTX_SRC=lbox_fact_corpus # lbox_statute_corpus
CTX_SRC=lbox_statute_corpus # lbox_statute_corpus
NUM_SHARDS=5
OUT_FILE=$OUT_FILE #/data/hanseok/law/statutes-ret-bert-multi/embs_stats_ckpt0/chunk


# fact retrieval - corpus size : 13317
# statutes retrieval - corpus size : 458098
echo "Retrieval corpus indexing...."

for i in $(seq 1 $NUM_SHARDS)
do
    echo $i
    CUDA_VISIBLE_DEVICES=$DEVICES python generate_dense_embeddings.py \
        model_file=$MODEL_FILE \
        ctx_src=$CTX_SRC \
        shard_id=$i \
        num_shards=$NUM_SHARDS \
        out_file=$OUT_FILE
done 
