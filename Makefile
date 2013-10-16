BITCOIND=litecoind
BITCOINGUI=litecoin-qt
MINER=minerd # https://github.com/pooler/cpuminer
B1_FLAGS=
B2_FLAGS=
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)

start:
	$(BITCOIND) $(B1) -daemon
	$(BITCOIND) $(B2) -daemon

start-gui:
	$(BITCOINGUI) $(B1) &
	$(BITCOINGUI) $(B2) &

generate-true:
	$(MINER) --algo scrypt --url http://127.0.0.1:19101 --user admin1 --pass 123

generate-false:
	killall $(MINER)

getinfo:
	$(BITCOIND) $(B1) getinfo
	$(BITCOIND) $(B2) getinfo

stop:
	$(BITCOIND) $(B1) stop
	$(BITCOIND) $(B2) stop

clean:
	git clean -fd 1/testnet3
	git clean -fd 2/testnet3
	git checkout -- 1/testnet3
	git checkout -- 2/testnet3
