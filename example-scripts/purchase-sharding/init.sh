#!/bin/bash

set -eou pipefail
IFS=$'\n\t'

shards=$1
    
if [[ ! -d "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}" ]] ; then
    mkdir "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}"
    mkdir "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/cache"
    mkdir "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times"
    mkdir "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/outputs"
    echo 0 > "/projectnb/ec523kb/students/gmharsh/unlearning/machine-unlearning/containers/${shards}/times/null.time"
fi

#python distribution.py --shards "${shards}" --distribution uniform --container "${shards}" --dataset datasets/purchase/datasetfile --label 0
python distribution.py --shards "${shards}" --distribution pareto --container "${shards}" --dataset datasets/purchase/datasetfile --label 0
#python distribution-new.py --shards "${shards}" --distribution uniform --container "${shards}" --dataset datasets/purchase/datasetfile --label 0

#for j in {1..150}; do
for j in {1..25}; do
    r=$((${j}*${shards}/20))
    #r=$((${j}*${shards}/20))
    #python distribution.py --requests "${r}" --distribution uniform --container "${shards}" --dataset datasets/purchase/datasetfile --label "${r}"
    python distribution.py --requests "${r}" --distribution pareto --container "${shards}" --dataset datasets/purchase/datasetfile --label "${r}"
    #python distribution-new.py --requests "${r}" --distribution uniform --container "${shards}" --dataset datasets/purchase/datasetfile --label "${r}"
done
