#!/bin/bash

#redis 源ip
src_ip=6.0.170.7
#redis 源port
src_port=6379

#redis 目的ip
dest_ip=6.0.170.15
#redis 目的port
dest_port=6379

#要迁移的key前缀
key_prefix=

i=1

redis-cli -h $src_ip -p $src_port  keys "${key_prefix}*" | while read key
do
  redis-cli -h $dest_ip -p $dest_port  del $key
  redis-cli -h $src_ip -p $src_port  --raw dump $key | perl -pe 'chomp if eof' | redis-cli -h $dest_ip -p $dest_port  -x restore $key 0
  echo "$i migrate key $key"
  ((i++))
done
