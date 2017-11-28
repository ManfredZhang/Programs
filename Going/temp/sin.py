import numpy as np
for j in range(256):
    data = np.floor(np.sin(j/256.0*2*3.1415926)*128)+128
    print "@%02x %02x" %(j,data)

