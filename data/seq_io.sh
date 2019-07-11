#!/bin/bash

in_file=raw/rw_io.csv
out_file=seq_io.csv

echo fs op median min max > ${out_file}
for fs in ext4 btrfs xfs zfs nilfs2 betrfs4 betrfs5; do
    for op in seq.read seq.write; do
        min=`grep -e "$fs,.$op," ${in_file} | sort -n -k 5 | head -1 | cut -f5 -d,`;
        max=`grep -e "$fs,.$op," ${in_file} | sort -n -k 5 | tail -1 | cut -f5 -d,`;
        lines=`grep -e "$fs,.$op," ${in_file} | sort -n -k 5 | wc -l`;
        medianindex=$[ 1 + $lines / 2 ];
        median=`grep -e "$fs,.$op," ${in_file} | sort -n -k 5 | head -$medianindex | tail -1 | cut -f5 -d,`;
        echo $fs $op $median $min $max >> ${out_file};
    done
done
