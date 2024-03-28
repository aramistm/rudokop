#!/bin/sh

# replace the wallet addresses with your own

# mine to e4pool
./rigel -a pyrinhash -o stratum+tcp://pyrin.e4pool.com:12100 -u YOUR_PYI_WALLET -w my_rig --log-file logs/miner.log

# mine to baikalmine
#./rigel -a pyrinhash -o stratum+tcp://pyi-eu.baikalmine.com:2727 -u YOUR_PYI_WALLET -w my_rig --log-file logs/miner.log

# mine to herominers
#./rigel -a pyrinhash -o stratum+tcp://de.pyrin.herominers.com:1177 -u YOUR_PYI_WALLET -w my_rig --log-file logs/miner.log

# mine to kryptex
#./rigel -a pyrinhash -o stratum+tcp://pyi.kryptex.network:7777 -u YOUR_PYI_WALLET -w my_rig --log-file logs/miner.log

# mine to 2miners
#./rigel -a pyrinhash -o stratum+tcp://pyi.2miners.com:2121 -u YOUR_PYI_WALLET -w my_rig --log-file logs/miner.log
