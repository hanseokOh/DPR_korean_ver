#!/bin/bash

echo "Validate on all corpus"

CUDA_VISIBLE_DEVICES=3 python dense_retriever.py \
model_file=/data/hanseok/law/fact-ret-bert-multi/dpr_biencoder.4 \
qa_dataset=lbox_fact_ret_test \
qrel_dataset=lbox_fact_ret_test_qrel \
ctx_datatsets=[lbox_fact_corpus] \
encoded_ctx_files=[\"/data/hanseok/law/fact-ret-bert-multi/embs_fact_ckpt4/chunk_*\"] \
out_file=/home/hanseok/projects/ai599_ai_for_law/project/DPR_korean_ver/dpr_bi_ckpt4.prediction.w_qrels.json

# CUDA_VISIBLE_DEVICES=3 python dense_retriever.py \
# model_file=/data/hanseok/law/fact-ret-bert-multi/dpr_biencoder.4 \
# qa_dataset=lbox_fact_ret_train \
# qrel_dataset=lbox_fact_ret_train_qrel \
# ctx_datatsets=[lbox_fact_corpus] \
# encoded_ctx_files=[\"/data/hanseok/law/fact-ret-bert-multi/embs_fact_ckpt4/chunk_*\"] \
# out_file=/home/hanseok/projects/ai599_ai_for_law/project/DPR_korean_ver/dpr_bi_ckpt4.prediction.train.w_qrels.json