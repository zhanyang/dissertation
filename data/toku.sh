#!/bin/bash

in_dir=raw/toku
out_dir=toku

for fs in ext4 btrfs xfs zfs nilfs2 betrfs3 betrfs3-max betrfs4 betrfs5
do
    in_file=${in_dir}/${fs}.csv
    out_file=${out_dir}/${fs}.csv
    truncate -s 0 ${out_file}
    while read line; do
        c1=`cut -f1 -d, <<< ${line}`;
        c3=`cut -f3 -d, <<< ${line}`;
        echo ${c1} ${c3} >> ${out_file};
    done < ${in_file}
done
