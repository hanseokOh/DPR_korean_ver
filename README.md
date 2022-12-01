# Custom readme for tuning

* setup
```
$ pip install .
$ python -m spacy download en
$ pip install datasets, gensim==3.8.3
```

* sometimes you need to manually download torch for your server's version


* Need to change 
```
conf/
├── biencoder_train_cfg.yaml
├── ctx_sources
│   └── default_sources.yaml # lbox_fact_corpus & lbox_statute_corpus에 해당하는 부분 file 부분 실제 경로에 맞게 변경
├── datasets
│   ├── encoder_train_default.yaml # lbox_* 해당하는 부분 file 부분 실제 경로에 맞게 변경
│   └── retriever_default.yaml # # lbox_* 해당하는 부분 file 부분 실제 경로에 맞게 변경
├── dense_retriever.yaml
├── encoder
│   ├── hf_bert.yaml
│   ├── korean_ver_hf_bert_kobert.yaml
│   └── korean_ver_hf_bert_multilingual.yaml
├── extractive_reader_train_cfg.yaml
├── gen_embs.yaml
├── korean_ver_biencoder_train_cfg.yaml
├── korean_ver_dense_retriever.yaml
├── README.md
└── train
    ├── biencoder_default.yaml
    ├── biencoder_local.yaml
    ├── biencoder_nq.yaml
    ├── extractive_reader_default.yaml
    └── korean_ver_biencoder_local.yaml # 실제 실험에 사용할 hyperparameter 조정 관련 
```

train, indexing, test에 해당하는 부분 개별 bash script에 환경 변수만 맞게 설정한 후 실행 

* train

``` $ bash ./train.sh ```

* indexing

``` $ bash ./indexing.sh ```

* test

``` $ bash ./test.sh ```
