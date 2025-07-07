#!/bin/bash

export TEST_DATA_DIR=./test_from_local
# from local
# export NIRVANA=testnet.riselabs.xyz
export NIRVANA="nirvana=rise.nirvanalabs.xyz/rise-main-ghfs3?apikey=a527f264aee1c9762b7da061c1f461cf2ff0"

export EXTRAS=--vegeta-args="-insecure"

# RATES=1024 2048 4096 8192 16384
RATES="2000 4000 5000 6000"

#
# # run tests
#

python -m flood eth_call \
    $NIRVANA \
    --output $TEST_DATA_DIR/eth_call \
    -r $RATES $EXTRAS

sleep 20

python -m flood eth_getBalance \
    $NIRVANA \
    --output $TEST_DATA_DIR/eth_getBalance \
    -d 1 \
    -r $RATES $EXTRAS

sleep 20

python -m flood eth_getBlockByNumber \
    $NIRVANA \
    --output $TEST_DATA_DIR/eth_getBlockByNumber \
    -r $RATES $EXTRAS

sleep 20

python -m flood eth_getCode \
    $NIRVANA \
    --output $TEST_DATA_DIR/eth_getCode \
    -r $RATES $EXTRAS

sleep 20

python -m flood eth_getLogs \
    $NIRVANA \
    --output $TEST_DATA_DIR/eth_getLogs \
    -r $RATES $EXTRAS

sleep 20

python -m flood eth_getStorageAt \
    $NIRVANA \
    --output $TEST_DATA_DIR/eth_getStorageAt \
    -r $RATES $EXTRAS

sleep 20

python -m flood eth_getTransactionByHash \
    $NIRVANA \
    --output $TEST_DATA_DIR/eth_getTransactionByHash \
    -r $RATES $EXTRAS

sleep 20

python -m flood eth_getTransactionReceipt \
    $NIRVANA \
    --output $TEST_DATA_DIR/eth_getTransactionReceipt \
    -r $RATES $EXTRAS

#
# # generate report
#

cd $TEST_DATA_DIR

python -m flood report \
    $TEST_DATA_DIR/eth_call \
    $TEST_DATA_DIR/eth_getBalance \
    $TEST_DATA_DIR/eth_getBlockByNumber \
    $TEST_DATA_DIR/eth_getCode \
    $TEST_DATA_DIR/eth_getLogs \
    $TEST_DATA_DIR/eth_getStorageAt \
    $TEST_DATA_DIR/eth_getTransactionByHash \
    $TEST_DATA_DIR/eth_getTransactionReceipt
