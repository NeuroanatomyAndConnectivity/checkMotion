## usage python motion2fd_rot.py relative_rotation_motion_file.1D voxeldisplacment_motion_file.1D
## computes a framedisplacement motion file (inputfile)
## from relative motion rotation file for example from fsl mcflirt output (outputfile)
import sys
import numpy as np
workfile = sys.argv[1]
outfile = sys.argv[2]
count=0;
with open(workfile) as f:
    floats = map(float, f)
change=np.zeros(len(floats),float)
for i in range(1,len(floats)):
    change[i]=floats[i]-floats[i-1]
    change[i]=2*3.142*50*(change[i]/360) ##compute rotation to voxeldisplacement
print outfile
np.savetxt(outfile, change,fmt='%-7.6f')
