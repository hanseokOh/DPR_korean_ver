#!/bin/bash


# fact retrieval - corpus size : 13317
echo "Fact retrieval corpus indexing...."

for i in $(seq 1 5)
do
    echo $i
    CUDA_VISIBLE_DEVICES=3 python generate_dense_embeddings.py \
        model_file=/data/hanseok/law/fact-ret-bert-multi/dpr_biencoder.4 \
        ctx_src=lbox_fact_corpus \
        shard_id=$i \
        num_shards=5 \
        out_file=/data/hanseok/law/fact-ret-bert-multi/embs_fact_ckpt4/chunk
done 
