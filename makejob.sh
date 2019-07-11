#!/bin/sh

cp -rf padova_lsf LSF_$1_qcut_$2_$3.job
rm -rf temp

#$1
sed s/INPUT1/$1/g LSF_$1_qcut_$2_$3.job > temp
mv temp LSF_$1_qcut_$2_$3.job
#$2
sed s/INPUT2/$2/g LSF_$1_qcut_$2_$3.job > temp
mv temp LSF_$1_qcut_$2_$3.job
#$3
#sed s/INPUT3/$3/g LSF_$1_qcut_$2_$3.job > temp
#mv temp LSF_$1_qcut_$2_$3.job

##
chmod a+x LSF_$1_qcut_$2_$3.job
##Send job
bsub -q $3 -o LSF_$1_qcut_$2_$3.log < LSF_$1_qcut_$2_$3.job