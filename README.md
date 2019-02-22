# Soal Shift modul 1
# SOAL 1
Untuk menyelesaikan soal nomor 1, maka langkah-langkahnya sebagai berikut:
1. Mengunduh file "nature.zip" ke dalam komputer (dalam hal ini, file nature.zip saya pindahkan ke home/modul_1/)

2. Membuat skrip bash sebagai berikut:
-ekstrak zip yang telah di unduh dengan perintah unzip "nama_file" (`unzip ~/modul_1/nature.zip`)
-setelah di ekstrak, maka kita harus mencari file tersebut lalu memilih hanya file dengan ekstensi ".jpg". Hal ini dapat dilakukan dengan menggunakan perintah ls "direktori" (`ls ~/modul_1/nature`) lalu dengan perintah grep "[.]"ekstensi_file$"" (`grep "[.]jpg$"`).Perintah ls digunakan untuk menampilkan isi dari sebuah direktori, sedangkan perintah grep digunakan untuk mengambil isi dengan kriteria tertentu. Untuk mempersingkat perintah, kita dapat menggunakan pipe, yaitu menjalankan lebih dari 1 perintah sekaligus. Hasil dari kedua perintah ini kemudian dimasukkan ke dalam variabel (step1). 
-setelah itu, variabel step1 di iterasi menggunakan loop, untuk mengkonversi file jpg. Perintah yang digunakan ialah base64 dan Hexdump. Perintah base64 digunakan untuk enkripsi atau dekripsi sebuah data. perintah yang digunakan ialah `base64 -d ~/modul_1/nature/"$i"`. Perintah tersebut akan menghasilkan heksadecimal dari file yang bersangkutan.Kemudian heksadecimal tersebut di kembalikan menjadi aslinya dan disimpan ke dalam file lain dengan perintah hexxdump (xxd -r > "direktori_file", -r berarti reverse, > berarti untuk menyimpan ke dalam file) `xxd -r > ~/modul_1/nature/"hasil$i"`.

3. Untuk menjalankan skrip pada waktu tertentu, maka dapat menggunakan perintah crontab, dengan ketentuan :
`14 14 14 2 5 ~/modul_1/soal1.sh`


# SOAL 2


# SOAL 3
Untuk menyelesaikan soal nomor 3, maka langkah-langkahnya sebagai berikut:
1. Dalam soal ini, kami mengasumsikan bahwa jumlah file password dibuat sesuai dengan inputan.
2. Membuat skrip bash sebagai berikut:
-mengambil jumlah input dengan perintah read, kemudian dimasukkan ke dalam variabel. (read jml)
-membuat iterasi loop sebanyak jumlah inputan (dengan variabel iterasi num, sebanyak jml).
-Sebelum membuat file password$num, maka di cek terlebih dahulu apakah file tersebut sudah ada atau belum. Hal ini dapat dilakukan dengan perintah -f "nama_file" (`-f "password$num.txt"`). Jika sudah ada file dengan nama tersebut, maka variabel $num akan di tambah 1. Sedangkan, jika tidak ditemukan dengan nama file tersebut, maka password akan tersimpan di file dengan nama tersebut. Perintah yang digunakan ialah `/dev/urandom tr -dc A-Za-z0-9 | head -c12 &>> "password$num.txt`. Untuk membuat random word alfanumerik digunakan perintah `/dev/urandom`, dengan ketentuan `A-Za-z0-9` menggunakan perintah tr. Setelah itu di limit sebanyak 12 karakter dengan perintah `head -c12`, dan disimpan ke dalam file dengan perintah `&>> "password$num.txt"`.

# SOAL 4


# SOAL 5
Untuk menyelesaikan soal nomor 5, maka langkah-langkahnya sebagai berikut:
1. Membuat skrip bash sebagai berikut:
- Menampilkan isi file syslog dengan perintah cat (`cat /var/log/syslog`).
- Menggunakan perintah awk untuk mengambil record yang sudah di cat, dengan ketentuan sebagai berikut:
 tidak mengandung string "sudo" namun mengandung string "cron" maka ketentuannya ( `/cron/ && !/sudo/`), lalu tidak bersifat case sensitive ( `tolower($0) && tolower($0)`), serta jumlah field pada baris kurang dari 13 ( `NF<13` ). Kemudian record dimasukkan dalam file log di direktori /home/[user]/modul1 ( `&>> ~/modul1` ).
Perintah seluruhnya adalah : `cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && tolower($0) ~ !/sudo/' | awk 'NF<13' >> ~/modul1`
2. Untuk menjalankan skrip pada waktu tertentu, maka menggunakan perintah crontab, dengan ketentuan:
2-30/6 * * * * "direktori_file" (`2-30/6 * * * * ~/modul_1/soal5.sh`)
