  #!/bin/bash
#script: script
#description: Dar los años de edad exactos.
#autor:Andres Heras

clear

if [ S# -ne 3 ]; then
    echo "Formato: $0 dia mes año"
    exit 1
fi

diaact=$(date +"%d")
mesact=$(date +"%m")
anoact=$(date +"%Y")

anoedad=$(($anoact-$3))
if [[ $mesact -lt $2 ]]; then
    anoedad=$(($anoedad-1))
fi

if [[ $anoedad -eq $2 ]]; then
    if [[ $anoedad -lt $1 ]]; then
    annoedad=$(($anoedad-1))
fi
