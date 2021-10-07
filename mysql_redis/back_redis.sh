#!/bin/bash

#redis 源ip
src_ip=172.16.0.2
#redis 源port
src_port=6379
src_password=Ab123145
src_db=0

#redis 目的ip
dest_ip=172.16.0.2
#redis 目的port
dest_port=6379
dest_password=Ab123145
dest_db=1

#要迁移的key前缀
key_prefix=

i=1

redis-cli -u redis://$src_password@$src_ip:$src_port/$src_db keys "${key_prefix}*" | while read key
do
  redis-cli -u redis://$dest_password@$dest_ip:$dest_port/$dest_db del $key
  redis-cli -u redis://$src_password@$src_ip:$src_port/$src_db --raw dump $key | perl -pe 'chomp if eof' | redis-cli -u redis://$dest_password@$dest_ip:$dest_port/$dest_db -x restore $key 0
  echo "$i migrate key $key"
  ((i++))
done
