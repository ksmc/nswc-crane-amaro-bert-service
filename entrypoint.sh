#!/bin/sh
# bert-serving-start -http_port 8125 -num_worker=$1 -model_dir /model
bert-serving-start -http_port 8125 -model_dir ./wwm_cased_L-24_H-1024_A-16 -max_seq_len 512 -num_worker 2 -pooling_layer -4 -3 -2 -1 -pooling_strategy CLS_TOKEN