#!/bin/sh

# replace the wallet addresses with your own

# mine to vipor
./rigel -a nexapow -o stratum+tcp://pool.vipor.net:5084 -u YOUR_NEXA_WALLET -w my_rig --log-file logs/miner.log

# mine to acc-pool
#./rigel -a nexapow -o stratum+tcp://acc-pool.pw:16011 -u YOUR_NEXA_WALLET -w my_rig --log-file logs/miner.log

# mine to woolypooly
#./rigel -a nexapow -o stratum+tcp://pool.woolypooly.com:3124 -u YOUR_NEXA_WALLET -w my_rig --log-file logs/miner.log

# mine to rplant
#./rigel -a nexapow -o stratum+tcp://stratum-eu.rplant.xyz:7092 -u YOUR_NEXA_WALLET -w my_rig --log-file logs/miner.log

# mine to kryptex
#./rigel -a nexapow -o stratum+tcp://nexa.kryptex.network:7777 -u YOUR_NEXA_WALLET -w my_rig --log-file logs/miner.log

# mine to pool137
#./rigel -a nexapow -o stratum+ssl://eu.nexa.pool137.io:3334 --no-strict-ssl -u YOUR_NEXA_WALLET -w my_rig --log-file logs/miner.log
