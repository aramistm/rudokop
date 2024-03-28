#!/bin/sh

# replace the wallet addresses with your own

# to manually balance GPU resources between primary and secondary algorithms
# use `--dual-mode` parameter, e.g.
# `--dual-mode a12:r0.1` - minimum impact on the primary algorithm
# `--dual-mode a12:r64` - maximum impact on the primary algorithm

# hyp + alph
./rigel -a ethashb3+alephium \
    -o [1]stratum+tcp://fr.vipor.net:5070                -u [1]0x12f151ac7497bbdec8f6ee0adfa209a943ef1d26 \
    -o [2]stratum+tcp://de.alephium.herominers.com:1199  -u [2]karlsen:qrehytexkxfvy4qa3lpxcd2t7k4mhmk52qxt77zl82x9xn9yxxld6q0k3nf4d \
    -w my_rig --log-file logs/miner.log
