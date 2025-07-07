#!/bin/bash

export TEST_DATA_DIR=./test_from_local
# from local
export NIRVANA=testnet.riselabs.xyz
export RISE=rise.nirvanalabs.xyz/rise-main-ghfs3?apikey=a527f264aee1c9762b7da061c1f461cf2ff0

# RATES=1024 2048 4096 8192 16384
RATES="1000 2000 4000 6000 8000 16000"

#
# # run tests
#

flood eth_call \
    node1=$NODE1 \
    node2=$NODE2 \
    --output $TEST_DATA_DIR/eth_call \
    -r $RATES

flood eth_getBalance \
    node1=$NODE1 \
    node2=$NODE2 \
    --output $TEST_DATA_DIR/eth_getBalance \
    -d 1 \
    -r $RATES

flood eth_getBlockByNumber \
    node1=$NODE1 \
    node2=$NODE2 \
    --output $TEST_DATA_DIR/eth_getBlockByNumber \
    -r $RATES

flood eth_getCode \
    node1=$NODE1 \
    node2=$NODE2 \
    --output $TEST_DATA_DIR/eth_getCode \
    -r $RATES

flood eth_getLogs \
    node1=$NODE1 \
    node2=$NODE2 \
    --output $TEST_DATA_DIR/eth_getLogs \
    -r $RATES

flood eth_getStorageAt \
    node1=$NODE1 \
    node2=$NODE2 \
    --output $TEST_DATA_DIR/eth_getStorageAt \
    -r $RATES

flood eth_getTransactionByHash \
    node1=$NODE1 \
    node2=$NODE2 \
    --output $TEST_DATA_DIR/eth_getTransactionByHash \
    -r $RATES

flood eth_getTransactionReceipt \
    node1=$NODE1 \
    node2=$NODE2 \
    --output $TEST_DATA_DIR/eth_getTransactionReceipt \
    -r $RATES

#
# # generate report
#

cd $TEST_DATA_DIR

flood report \
    $TEST_DATA_DIR/eth_call \
    $TEST_DATA_DIR/eth_getBalance \
    $TEST_DATA_DIR/eth_getBlockByNumber \
    $TEST_DATA_DIR/eth_getCode \
    $TEST_DATA_DIR/eth_getLogs \
    $TEST_DATA_DIR/eth_getStorageAt \
    $TEST_DATA_DIR/eth_getTransactionByHash \
    $TEST_DATA_DIR/eth_getTransactionReceipt
