#!/bin/sh

# replace the wallet addresses with your own

# mine to woolypooly
#./rigel -a octopus -o stratum+tcp://pool.woolypooly.com:3094 -u YOUR_CFX_WALLET -w my_rig --log-file logs/miner.log

# mine to herominers
./rigel -a octopus -o stratum+tcp://de.conflux.herominers.com:1170 -u cfx:aarxn7a22tubxzyhpwcsmy0xr9taaugbhptc04jmh2 -w 6x3070L-6634 --log-file logs/miner.log

# mine to kryptex
#./rigel -a octopus -o stratum+tcp://cfx.kryptex.network:7777 -u YOUR_CFX_WALLET -w my_rig --log-file logs/miner.log
