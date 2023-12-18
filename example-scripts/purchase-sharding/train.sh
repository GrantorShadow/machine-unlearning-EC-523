#!/bin/bash

set -eou pipefail
IFS=$'\n\t'

shards=$1

for i in $(seq 0 "$((${shards}-1))"); do
    #for j in {0..15}; do
    for j in {0..15}; do
        echo "shard: $((${i}+1))/${shards}, requests: $((${j}+1))/20"
        r=$((${j}*${shards}/20))
        python sisa.py --model purchase --train --slices 5 --dataset datasets/purchase/datasetfile --label "${r}" --epochs 5 --batch_size 16 --learning_rate 0.001 --optimizer sgd --chkpt_interval 1 --container "${shards}" --shard "${i}"
    done
done
 
