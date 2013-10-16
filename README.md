# litecoin-testnet-box

This is a private, difficulty 1 testnet in a box.

The master branch is meant for litecoind v0.8.0. 
Check the tags for other litecoind versions.

You must have litecoind installed on your system and in the path.

## Starting the testnet-box

This will start-up two nodes using the two datadirs `1` and `2`. They
will only connect to each other in order to remain an isolated private testnet.
You need two because otherwise the node won't generate blocks.

Node `1` will listen on port `19100`, allowing node `2` to connect to it.

Node `1` will listen on port `19101` and node `2` will listen on port `19111` 
for the JSON-RPC server.


```
$ make start
```

## Check the status of the nodes

```
$ make getinfo
litecoind -datadir=1  getinfo
{
    "version" : 80501,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 3200.00000000,
    "blocks" : 183,
    "timeoffset" : 0,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 0.00024414,
    "testnet" : true,
    "keypoololdest" : 1381902124,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "mininput" : 0.00010000,
    "errors" : ""
}
litecoind -datadir=2  getinfo
{
    "version" : 80501,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 183,
    "timeoffset" : 0,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 0.00024414,
    "testnet" : true,
    "keypoololdest" : 1381894058,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "mininput" : 0.00010000,
    "errors" : ""
}
```

## Generating blocks

To start generating blocks:

```
$ make generate-true
```
  
To stop generating blocks:

```
$ make generate-false
```
  
## Stopping the testnet-box
  
```
$ make stop
```
  
To clean up any files created while running the testnet and restore to the 
original state:

```
$ make clean
```
