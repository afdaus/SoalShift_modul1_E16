#/var/log/syslog

jam=`date +%H`

menit=`date +%M`

tanggal=`date +%d`

bulan=`date +%m`

tahun=`date +%Y`

filename="$jam:$menit $tanggal-$bulan-$tahun"

function encryption(){
        `awk '
        BEGIN{
                for (n=0;n<256;n++){
                        ord[sprintf("%c",n)]=n
                        chr[n]=sprintf("%c",n)
                }
        }
        {
                split($0, chars, "")
                for (i=1;i<=length($0);i++){
                        temp=ord[chars[i]]
                        if (temp > 96 && temp < 123) {
                                temp=temp+'"$jam"';
                                if (temp > 122) temp=97+(temp%123)
                        }else if (temp > 64 && temp < 91) {
                                temp=temp+'"$jam"';
                                if (temp > 90) temp=65+(temp%91)
                        }
                        printf ("%s", chr[temp])
                }
                printf("\n")
        }
        ' < "/var/log/syslog" > "$filename"`
}

encryption
