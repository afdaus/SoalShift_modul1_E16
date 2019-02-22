function decryption(){
        jamDec=$2
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
                                temp=temp-'"$jamDec"';
                                if (temp < 97) temp=122-(96-temp)
                        }else if (temp > 64 && temp < 91) {
                                temp=temp-'"$jamDec"';
                                if (temp < 65) temp=90-(64-temp)
                        }
                        printf ("%s", chr[temp])
                }
                printf("\n")
        }
        ' < "$1" > "decrypted$1"`
}

echo "decrypting $1"

filename=$1

jamdecrypt=${filename:0:2}

decryption "$1" "$jamdecrypt"
