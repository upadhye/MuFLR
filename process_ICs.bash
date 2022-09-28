#!/bin/bash
NK=256
INPUT=nu05_Ntau20_Nmu20.txt
OUTPUT_BASE=nu05_Ntau20_Nmu20

NZ=$(echo $(grep "^[0-9]" ${INPUT} | wc -l) "/${NK}" | bc)

for ((IZ=0; IZ<${NZ}; IZ++)); do
  NH=$(echo "(1+${IZ})*${NK}" | bc)
  grep "^[0-9]" ${INPUT} | head -${NH} | tail -${NK} | awk '{print $1, $2}' > ${OUTPUT_BASE}_iz${IZ}_Pk.txt
  grep "^[0-9]" ${INPUT} | head -${NH} | tail -${NK} | awk '{print $1, $3/$2}' > ${OUTPUT_BASE}_iz${IZ}_f.txt
done


