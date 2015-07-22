#!/bin/bash

for grabaciones in `ls *.rtp`
do
rtpbreak -W -r $grabaciones
done
sox --combine merge -r 8k -e a-law rtp.0.0.raw -r 8k -e a-law rtp.1.0.raw -t wavpcm -e signed-integer out.wav
rm  rtp.0.0.*
rm  rtp.1.0.*
rm  rtp.0.txt
rm  rtp.1.txt
mv out.wav $grabaciones.wav
