#!/bin/bash

set -eou pipefail
IFS=$'\n\t'

shards=$1

example-scripts/purchase-sharding/init.sh ${shards}
example-scripts/purchase-sharding/train.sh ${shards}
example-scripts/purchase-sharding/predict.sh ${shards}
example-scripts/purchase-sharding/data-new.sh ${shards}