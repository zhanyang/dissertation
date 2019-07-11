#!/bin/bash

in_file=raw/rw_io.csv
out_file=rand_io.csv

truncate -s 0 ${out_file}
for fs in ext4 btrfs xfs zfs nilfs2 betrfs4 betrfs5; do
    echo -n " \\pgfkeysvalueof{/fs-names/$fs} " >> ${out_file}
    for op in rand.write; do
        min=`grep -e "$fs,.$op," ${in_file} | sort -n -k 4 | cut -f4 -d, | head -1`
        max=`grep -e "$fs,.$op," ${in_file} | sort -n -k 4 | cut -f4 -d, | tail -1`
        lines=`grep -e "$fs,.$op," ${in_file} | sort -n -k 4 | cut -f4 -d, | wc -l`
        medianindex=$[ 1 + $lines / 2 ]
        median=`grep -e "$fs,.$op," ${in_file} | sort -n -k 4 | cut -f4 -d, | head -$medianindex | tail -1`
        error=`bc <<EOF
(($median - $min) > ($max - $median)) * ($median - $min) + (($median - $min) <= ($max - $median)) * ($max - $median)
EOF`
        if [ ${error:0:1} == "." ]; then
            error=0$error
        fi
        error=`echo $error | sed "s/\(.*\)\.\(.\).*/\1.\2/"`
        median=`echo $median | sed "s/\(.*\)\.\(.\).*/\1.\2/"`
        echo -n " & " $median " & " $error >> ${out_file}
    done
    echo " \\\\" >> ${out_file};
done
