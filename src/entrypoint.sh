#!/bin/bash
# bash script designed to start worldcoin-abe in a docker container.
# Copyright (c) 2015 Worldcoin Developers
# Distributed under the MIT/X11 software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

service mysql start
python -m Abe.abe --config=/home/worldcoin-abe/mysql.conf --commit-bytes 100000 --no-serve
python -m Abe.abe --config=/home/worldcoin-abe/mysql.conf
