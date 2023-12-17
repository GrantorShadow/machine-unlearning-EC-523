#!/bin/bash

set -eou pipefail
IFS=$'\n\t'

shards=$1

for i in $(seq 0 "$((${shards}-1))"); do
    for j in {0..25}; do
    #for j in {0..150}; do
        #echo "shard: $((${i}+1))/${shards}, requests: $((${j}+1))/151"
        echo "shard: $((${i}+1))/${shards}, requests: $((${j}+1))/26"
        r=$((${j}*${shards}/20))
        #r=$((${j}*${shards}/20))
        #python sisa.py --model purchase --train --slices 1 --dataset datasets/purchase/datasetfile --label "${r}" --epochs 20 --batch_size 16 --learning_rate 0.001 --optimizer sgd --chkpt_interval 1 --container "${shards}" --shard "${i}"
        python sisa.py --model purchase --train --slices 5 --dataset datasets/purchase/datasetfile --label "${r}" --epochs 5 --batch_size 16 --learning_rate 0.001 --optimizer sgd --chkpt_interval 1 --container "${shards}" --shard "${i}"
    done
done
