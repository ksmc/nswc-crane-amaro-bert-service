#!/bin/sh
# bert-serving-start -http_port 8125 -num_worker=$1 -model_dir /model
bert-serving-start -model_dir ./wwm_cased_L-24_H-1024_A-16_cus -max_seq_len 512 -num_worker 4 -pooling_layer -4 -3 -2 -1 -pooling_strategy NONE -max_batch_size 64 -show_tokens_to_client