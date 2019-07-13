#!/bin/bash

LHEDIR=./LHE/ ##YOUR LHE LOCATION
queue=local-cms-short

Scan () {
    echo "SCAN Qcut on one sample: $file"
    XQCUT=`(grep "minimum kt jet measure between partons" ${LHEDIR}/$file)`
    echo LHE:: Xqcut value assigned = ${XQCUT}
    for qcut in $(seq 20 2 120) #scanning from 20 to 120 GeV in step of 5 #120 
    do
	echo "./makejob.sh ${model} ${qcut} ${queue}"  
        ./makejob.sh ${model} ${qcut} ${queue}
    done
}

for file in `(ls ${LHEDIR})`
do
    model=`(echo $file | awk -F '_' '{print $1"_"$2}')`
    Scan

done
