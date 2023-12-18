#!/bin/bash

set -eou pipefail
IFS=$'\n\t'

shards=$1

if [[ ! -f general-report.csv ]]; then
    echo "nb_shards,nb_requests,accuracy,retraining_time" > general-report.csv
fi

#for j in {0..150}; do
for j in {0..15}; do
    r=$((${j}*${shards}/20))
    #r=$((${j}*${shards}/20))
    acc=$(python aggregation.py --strategy uniform --container "${shards}" --shards "${shards}" --dataset datasets/purchase/datasetfile --label "${r}")
    cat /Users/harshil/Downloads/unlearning/machine-unlearning/containers/"${shards}"/times/shard-*:"${r}".time > "/Users/harshil/Downloads/unlearning/machine-unlearning/containers/${shards}/times/times"
    
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-0:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-1:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-2:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-3:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-4:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-5:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-6:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-7:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-8:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-9:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-10:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-11:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-12:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-13:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-14:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-15:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-16:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-17:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-18:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    #cat "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/shard-19:${r}.time" > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/times"
    
    time=$(python time.py --container "${shards}" | awk -F ',' '{print $1}')
    echo "${shards},${r},${acc},${time}" >> general-report.csv

done