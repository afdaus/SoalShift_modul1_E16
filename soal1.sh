#!/bin/bash
`unzip ~/modul_1/nature.zip`
step1=`ls ~/modul_1/nature | grep "[.]jpg$"`

for i in $step1
do
	`base64 -d ~/modul_1/nature/"$i" | xxd -r > ~/modul_1/nature/"hasil$i"`
done



