#!/bin/bash

set -eou pipefail
IFS=$'\n\t'

shards=$1
    
if [[ ! -d "/Users/

harshil/Downloads/unlearning/machine-unlearning/containers/${shards}" ]] ; then
    mkdir "/Users/harshil/Downloads/unlearning/machine-unlearning/containers/${shards}"
    mkdir "/Users/harshil/Downloads/unlearning/machine-unlearning/containers/${shards}/cache"
    mkdir "/Users/harshil/Downloads/unlearning/machine-unlearning/containers/${shards}/times"
    mkdir "/Users/harshil/Downloads/unlearning/machine-unlearning/containers/${shards}/outputs"
    echo 0 > "/Users/harshil/Downloads/unlearning/machine-unlearning/containers/${shards}/times/null.time"
fi

#python distribution.py --shards "${shards}" --distribution uniform --container "${shards}" --dataset datasets/purchase/datasetfile --label 0
#python distribution.py --shards "${shards}" --distribution pareto:3 --container "${shards}" --dataset datasets/purchase/datasetfile --label 0
python distribution.py --shards "${shards}" --distribution kmeans --container "${shards}" --dataset datasets/purchase/datasetfile --label 0

for j in {1..15}; do
    r=$((${j}*${shards}/20))
    #python distribution.py --requests "${r}" --distribution uniform --container "${shards}" --dataset datasets/purchase/datasetfile --label "${r}"
    #python distribution.py --requests "${r}" --distribution pareto:3 --container "${shards}" --dataset datasets/purchase/datasetfile --label "${r}"
    python distribution.py --requests "${r}" --distribution kmeans --container "${shards}" --dataset datasets/purchase/datasetfile --label "${r}"
done

