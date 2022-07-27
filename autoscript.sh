#!/bin/bash

if [ $# -ne 2 ]
then
	echo "2 parameters needed. size in bytes and threads count"
fi
echo 3 > /proc/sys/vm/drop_caches

sleep 5

gcc -mcmodel=large -fopenmp -D_OPENMP -DSTREAM_ARRAY_SIZE=$10000000 -O stream.c -o stream -lpmemobj -L/usr/lib/
export OMP_NUM_THREADS=$2

#perf mem record -a --call-graph dwarf -- /home/kau/STREAM_FRW/stream
#perf stat -e cache-misses,cache-references /home/kau/STREAM_FRW/stream
/home/kau/STREAM_FRW/stream

sleep 1

#rm -rf /home/kau/STREAM_FRW/dummy/*
