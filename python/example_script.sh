subjects=("GSDT" "JA3T" "RMBT" "RT5T" "TF2T" "WK6T")
scans=("rest1" "rest2" "rest3" "rest4")
for i in "${subjects[@]}"
do	for j in "${scans[@]}"
		do python motion2fd.py /scr/litauen2/montreal_2012_02_11/data/$i/$j/nuisance/mc1.1D ./mc1_${i}_${j}_fd.1D
		python motion2fd.py /scr/litauen2/montreal_2012_02_11/data/$i/$j/nuisance/mc2.1D ./mc2_${i}_${j}_fd.1D
        python motion2fd.py /scr/litauen2/montreal_2012_02_11/data/$i/$j/nuisance/mc3.1D ./mc3_${i}_${j}_fd.1D
		
        python motion2fd_rot.py /scr/litauen2/montreal_2012_02_11/data/$i/$j/nuisance/mc4.1D ./mc4_${i}_${j}_fd.1D
		python motion2fd_rot.py /scr/litauen2/montreal_2012_02_11/data/$i/$j/nuisance/mc5.1D ./mc5_${i}_${j}_fd.1D
        python motion2fd_rot.py /scr/litauen2/montreal_2012_02_11/data/$i/$j/nuisance/mc6.1D ./mc6_${i}_${j}_fd.1D

	    python motionfd2max_mean.py ./mc?_${i}_${j}_fd.1D ./${i}_${j}_max_mean.1D
done
done
