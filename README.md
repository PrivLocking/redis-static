# redis static

if you need a redis newest static build binary, come here and take it away, or take my building script to build by yourself.

## it is a static build: 
server is about 4.1M bytes.

client is about 1.4M bytes.

you can download the binaray in my [bin/ directory](https://github.com/jjj123wetalk/redis-static/tree/main/bin).

They are static build and in most case you can run it anywhere.

```bash
file bin/redis-server
bin/redis-server: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-musl-x86_64.so.1, BuildID[sha1]=79de6a5528846a9b4e6fde3bba23a2ff8709844d, stripped
```

if , you want to build by yourself, then you can download the Makefile.

It can guide you build the static binary step by step.

## it is use the newest version ( git version ) from the [origin redis branch](https://github.com/redis/redis)

