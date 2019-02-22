#!/bin/bash
echo "Masukkan jumlah password yang ingin dibuat:"
read jml

for ((num=1; num<=jml; num+=1))
do
	if [ -f ~/modul_1/"password$num.txt" ]
		then jml=$jml+1
	else
		`< /dev/urandom tr -dc A-Za-z0-9 | head -c12 &>> "password$num.txt"`
	fi
done
