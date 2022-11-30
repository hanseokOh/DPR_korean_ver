#!/bin/bash

DEVICES=0,1
NUM_NODE=2

## STATUTE-RETREIVER default config
# TRAIN_DATASETS=lbox_stat_ret_train
# DEV_DATASETS=lbox_stat_ret_dev
# TRAIN_CONFIG=korean_ver_biencoder_local
# ENCODER=korean_ver_hf_bert_multilingual # korean_ver_hf_bert_kobert
# OUTPUT_DIR=/data/hanseok/law/statutes-ret-bert-multi

## Casual STATUTE-RETREIVER default config
# TRAIN_DATASETS=lbox_casual_stat_ret_train
# DEV_DATASETS=lbox_casual_stat_ret_dev
# TRAIN_CONFIG=korean_ver_biencoder_local
# ENCODER=korean_ver_hf_bert_multilingual # korean_ver_hf_bert_kobert
# OUTPUT_DIR=/data/hanseok/law/casual_statutes-ret-bert-multi

## FACT-RETREIVER default config
# TRAIN_DATASETS=lbox_fact_ret_train
# DEV_DATASETS=lbox_fact_ret_dev
# TRAIN_CONFIG=korean_ver_biencoder_local
# ENCODER=korean_ver_hf_bert_multilingual # korean_ver_hf_bert_kobert
# OUTPUT_DIR=/data/hanseok/law/fact-ret-bert-multi

## Multi-task STATUTE-RETREIVER default config
TRAIN_DATASETS=lbox_stat_ret_train,lbox_casual_stat_ret_train
DEV_DATASETS=lbox_stat_ret_dev,lbox_casual_stat_ret_dev
TRAIN_CONFIG=korean_ver_biencoder_local
ENCODER=korean_ver_hf_bert_multilingual # korean_ver_hf_bert_kobert
OUTPUT_DIR=/data/hanseok/law/multitask_statutes-ret-bert-multi

CUDA_VISIBLE_DEVICES=$DEVICES \
python -m torch.distributed.launch \
--nproc_per_node=$NUM_NODE \
train_dense_encoder.py \
train_datasets=[$TRAIN_DATASETS] \
dev_datasets=[$DEV_DATASETS] \
train=$TRAIN_CONFIG \
encoder=$ENCODER \
output_dir=$OUTPUT_DIR
