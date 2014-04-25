## usage python motionMaxMean.py framedisplacement_motion_file.1D ..framedisplacement_motion_file.1D Max_Mean_file.1D
## computes max and mean (outputfile)
## from of multiple framedisplacement files (inputfile)
import sys
import numpy as np
number_arguments=len(sys.argv)
outfile = sys.argv[number_arguments-1]
maxa=np.zeros(number_arguments-2)
mean=np.zeros(number_arguments-2)
for i in range (1,number_arguments-1):
    workfile = sys.argv[i]
    with open(workfile) as f:
        workfile = sys.argv[i]
        floats = map(float, f)
    floats=np.abs(np.array(floats))
    maxa[i-1]=floats.max()
    mean[i-1]=np.average(floats)
print maxa
data=np.array([maxa.max(),np.average(mean)])
np.savetxt(outfile, data,fmt='%-7.6f')
