#!/bin/bash

echo "Validate on all corpus"
DEVICES=0,1

## STATUTE-RETREIVER default config
MODEL_FILE=/data/hanseok/law/statutes-ret-bert-multi/dpr_biencoder_bert_multi.9 #$MODEL_FILE # 
QA_DATASET=lbox_stat_ret_test
QREL_DATASET=lbox_stat_ret_test_qrel
CTX_DATASETS=lbox_statute_corpus
ENCODEDE_CTX_FILES="/data/hanseok/law/statutes-ret-bert-multi/embs_stats_ckpt9/chunk_*" #$ENCODEDE_CTX_FILES #\"/data/hanseok/law/fact-ret-bert-multi/embs_stat_ckpt36/chunk_*\"
OUT_FILE=/home/hanseok/projects/ai599_ai_for_law/project/DPR_korean_ver/dpr_stat_ret_ckpt_9.prediction.json  #$OUT_FILE #/home/hanseok/projects/ai599_ai_for_law/project/DPR_korean_ver/dpr_bi_ckpt36.prediction.w_qrels.json

## Casual STATUTE-RETREIVER default config
# MODEL_FILE=#$MODEL_FILE 
# QA_DATASET=lbox_casual_stat_ret_test
# QREL_DATASET=lbox_casual_stat_ret_test_qrel
# CTX_DATASETS=lbox_statute_corpus
# ENCODEDE_CTX_FILES=#$ENCODEDE_CTX_FILES 
# OUT_FILE=#$OUT_FILE #/home/hanseok/projects/ai599_ai_for_law/project/DPR_korean_ver/dpr_bi_ckpt36.prediction.w_qrels.json

## FACT-RETREIVER default config
#MODEL_FILE=$MODEL_FILE # /data/hanseok/law/fact-ret-bert-multi/dpr_biencoder_bert_multi.36
#QA_DATASET=lbox_fact_ret_test
#QREL_DATASET=lbox_fact_ret_test_qrel
#CTX_DATASETS=lbox_fact_corpus
#ENCODEDE_CTX_FILES=$ENCODEDE_CTX_FILES #\"/data/hanseok/law/fact-ret-bert-multi/embs_stat_ckpt36/chunk_*\"
#OUT_FILE=$OUT_FILE #/home/hanseok/projects/ai599_ai_for_law/project/DPR_korean_ver/dpr_bi_ckpt36.prediction.w_qrels.json


CUDA_VISIBLE_DEVICES=$DEVICES python dense_retriever.py \
model_file=$MODEL_FILE \
qa_dataset=$QA_DATASET \
qrel_dataset=$QREL_DATASET \
ctx_datatsets=[$CTX_DATASETS] \
encoded_ctx_files=[$ENCODEDE_CTX_FILES] \
out_file=$OUT_FILE
