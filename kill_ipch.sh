#!/bin/bash

m=0
s=0
q=0


ME=`whoami`

IPCS_S=`ipcs -s | egrep "0x[0-9a-f]+ [0-9]+" | grep $ME | cut -f2 -d" "`
IPCS_M=`ipcs -m | egrep "0x[0-9a-f]+ [0-9]+" | grep $ME | cut -f2 -d" "`
IPCS_Q=`ipcs -q | egrep "0x[0-9a-f]+ [0-9]+" | grep $ME | cut -f2 -d" "`


for id in $IPCS_M; do
    ipcrm -m $id; m=$(( $m+1 ));
done

for id in $IPCS_S; do
    ipcrm -s $id; s=$(( $s+1 ));
done

for id in $IPCS_Q; do
    ipcrm -q $id; q=$(( $q+1 ));
done

echo kill $m Messages, $s Semaphores, $q Queles,
