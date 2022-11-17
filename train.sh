#!/bin/bash

## Statutes retrieval
# bert-base-multilingual-uncased
python -m torch.distributed.launch \
--nproc_per_node=4 \
train_dense_encoder.py \
train_datasets=[lbox_stat_ret_train] \
dev_datasets=[lbox_stat_ret_dev] \
train=korean_ver_biencoder_local \
encoder=korean_ver_hf_bert_multilingual

# skt/kobert-base-v1
python -m torch.distributed.launch \
--nproc_per_node=4 \
train_dense_encoder.py \
train_datasets=[lbox_stat_ret_train] \
dev_datasets=[lbox_stat_ret_dev] \
train=korean_ver_biencoder_local \
encoder=korean_ver_hf_bert_kobert

## Fact retrieval 
# bert-base-multilingual-uncased
python -m torch.distributed.launch \
--nproc_per_node=4 \
train_dense_encoder.py \
train_datasets=[lbox_fact_ret_train] \
dev_datasets=[lbox_fact_ret_dev] \
train=korean_ver_biencoder_local \
encoder=korean_ver_hf_bert_multilingual

# skt/kobert-base-v1
python -m torch.distributed.launch \
--nproc_per_node=4 \
train_dense_encoder.py \
train_datasets=[lbox_fact_ret_train] \
dev_datasets=[lbox_fact_ret_dev] \
train=korean_ver_biencoder_local \
encoder=korean_ver_hf_bert_kobert
