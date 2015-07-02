# worldcoinabe-docker

http://www.worldcoin.global
 
Copyright (c) 2015 Worldcoin Developers

Run [worldcoin-abe](https://github.com/alferz/worldcoin-abe) in a docker container.

## What is Worldcoin?

Worldcoin is an improved version of Bitcoin using Scrypt as a proof-of-work algorithm.
 - 30 second block targets
 - 120 blocks to retarget difficulty
 - starts at 64 coins per block
 - subsidy is reduced 1% every week to a minimum reward of 1 WDC per block
 - ~265 million total coins


## Building:

### Build image :
```
docker build --rm -t <yourname/imagename> .
```
### Run container from image :
```
docker run -d --name <container_name> -P -p <external_container_port>:80 -v /root/.worldcoin:/root/.worldcoin <yourname/imagename>
```

## License:

worldcoinabe-docker is released under the terms of the MIT/X11 software license.
See `LICENSE` for more or see http://www.opensource.org/licenses/mit-license.php.