# Soal Shift modul 1
# SOAL 1
Untuk menyelesaikan soal nomor 1, maka langkah-langkahnya sebagai berikut:
1. Mengunduh file "nature.zip" ke dalam komputer (dalam hal ini, file nature.zip saya pindahkan ke home/modul_1/)

2. Membuat skrip bash sebagai berikut:
- Ekstrak zip yang telah di unduh dengan perintah unzip "nama_file" (`unzip ~/modul_1/nature.zip`)
- Setelah di ekstrak, maka kita harus mencari file tersebut lalu memilih hanya file dengan ekstensi ".jpg". Hal ini dapat dilakukan dengan menggunakan perintah ls "direktori" (`ls ~/modul_1/nature`) lalu dengan perintah grep "[.]"ekstensi_file$"" (`grep "[.]jpg$"`).Perintah ls digunakan untuk menampilkan isi dari sebuah direktori, sedangkan perintah grep digunakan untuk mengambil isi dengan kriteria tertentu. Untuk mempersingkat perintah, kita dapat menggunakan pipe, yaitu menjalankan lebih dari 1 perintah sekaligus. Hasil dari kedua perintah ini kemudian dimasukkan ke dalam variabel (step1). 
- Setelah itu, variabel step1 di iterasi menggunakan loop, untuk mengkonversi file jpg. Perintah yang digunakan ialah base64 dan Hexdump. Perintah base64 digunakan untuk enkripsi atau dekripsi sebuah data. perintah yang digunakan ialah `base64 -d ~/modul_1/nature/"$i"`. Perintah tersebut akan menghasilkan heksadecimal dari file yang bersangkutan.Kemudian heksadecimal tersebut di kembalikan menjadi aslinya dan disimpan ke dalam file lain dengan perintah hexxdump (xxd -r > "direktori_file", -r berarti reverse, > berarti untuk menyimpan ke dalam file) `xxd -r > ~/modul_1/nature/"hasil$i"`.

3. Untuk menjalankan skrip pada waktu tertentu, maka dapat menggunakan perintah crontab, dengan ketentuan :
`14 14 14 2 5 ~/modul_1/soal1.sh`


# SOAL 2
Untuk menyelesaikan soal nomor 2, kita memerlukan syntax dibawah ini:
1. `awk -F, '{if($7=='2012') iter [$1]+=$10} END{for (hasil in iter) print iter[hasil], hasil}' WA_Sales_Products_2012-14.csv OFS=','| sort -nr | head -n1 | awk -F, '{print $2}'`
2. `awk -F, '{if($7 == '2012' && $1=="United States") iter[$4]+=$10} END {for(hasil in iter) {print iter[hasil], hasil}}' WA_Sales_Products_2012-14.csv OFS=',' | sort -nr | head -n3 | awk -F, '{print $2}'`
3. `awk -F, '{if(($7 == '2012' && $1=="United States")  && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) iter[$6]+=$10} END {for(hasil in iter) {print iter[hasil], hasil}}' WA_Sales_Products_2012-14.csv OFS=',' | sort -nr | head -n3 | awk -F, '{print $2}'`
Penjelasan :
- Pada soal nomor 2 ini kita menggunakan awk, pada nomor 2a kita menghitung jumlah quantity setiap negara dan mengurutkannya, pertama negaranya dibuat menjadi array yang berisi quantity penjualan negara tersebut, serta menanmbahkan `{if($7=='2012')` yang berarti hanya quantity pada tahun 2012 yang ditambah. Setelah itu diurutkan dengan `sort -nr` yang artinya mengurutkan dari yang terbesar ke yang terkecil. Di soal 2a ini hanya diminta menampilkan 1 negara dengan penjualan terbanyak, kita tinggal menambahkan `head -n1`.
- Karena pada soal 2a kita telah mengetahui negara dengan penjualan terbanyak yaitu United States, pada soal 2b ini kita tinggal menambahkan satu lagi syaratnya `{if($7 == '2012' && $1=="United States")`. Dan pada soal ini kita diminta menampilkan tiga product line dengan penjualan terbanyak. Tinggal menambahkan `head -n3`
- Setelah mengetahui 3 product line dengan penjualan terbanyak kita dapat mengerjakan soal 2b dengan menambahkan syarat lagi `($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection"))`. Selebihnya sama.
- Keterangan :
- $1 = kolom dari negara
- $4 = kolom dari product line
- $6 = kolom dari procut
- $7 = kolom dari tahun
- $10 = kolom dari quantity


# SOAL 3
Untuk menyelesaikan soal nomor 3, maka langkah-langkahnya sebagai berikut:
1. Dalam soal ini, kami mengasumsikan bahwa jumlah file password dibuat sesuai dengan inputan.
2. Membuat skrip bash sebagai berikut:
- Mengambil jumlah input dengan perintah read, kemudian dimasukkan ke dalam variabel. (read jml)
- Membuat iterasi loop sebanyak jumlah inputan (dengan variabel iterasi num, sebanyak jml).
- Sebelum membuat file password$num, maka di cek terlebih dahulu apakah file tersebut sudah ada atau belum. Hal ini dapat dilakukan dengan perintah -f "nama_file" (`-f "password$num.txt"`). Jika sudah ada file dengan nama tersebut, maka variabel $num akan di tambah 1. Sedangkan, jika tidak ditemukan dengan nama file tersebut, maka password akan tersimpan di file dengan nama tersebut. Perintah yang digunakan ialah `/dev/urandom tr -dc A-Za-z0-9 | head -c12 &>> "password$num.txt`. Untuk membuat random word alfanumerik digunakan perintah `/dev/urandom`, dengan ketentuan `A-Za-z0-9` menggunakan perintah tr. Setelah itu di limit sebanyak 12 karakter dengan perintah `head -c12`, dan disimpan ke dalam file dengan perintah `&>> "password$num.txt"`.

# SOAL 4
Jadi pertamanya kami mengambil data jam, menit, tanggal, bulan, tahun untuk dimasukkan ke nama file dengan syntax nama file seperti ini : "jam:menit: tanggal-bulan-tahun". Lalu saya membuat fungsi enkripsi yang berfungsi untuk mengubah isi file syslog sesuai yang diminta di soal yaitu menambahkan setiap alphabet pada file dengan jam saat di enkripsi. Pada awalnya terdapat fungsi BEGIN :Fungsi ini berfungsi untuk mendefinisikan seluruh karakter ASCII pada variabel n dimulai dari index ke 0 sampai dengan index 255. Lalu dilanjutkan dengan fungsi `split($0, chars, "")`. Fungsi split di atas digunakan untuk memecah isi file syslog menjadi per karakter agar bisa di enkripsi per karakternya. Pada awalnya semua karakter yang ke record akan diubah ke ASCII. Lalu jika karakter yang diubah ke ASCII tersebut + jam enkripsinya berada pada selang 97-122 (a-z pada ASCII) maka langsung print chr(ASCII) nya. Sedangkan jika karakter ASCII + jam enkripsi nya berada di >122 maka akan dimulai lagi dari 97 dengan cara temp=97+(temp%123). Lalu dengan ASCII + jam enkripsi yang berada pada selang 65-91 (A-Z pada ASCII) maka langsung print chr(ASCII) nya. 
Sedangkan jika karakter ASCII + jam nya berada di > 90 maka akan dimulai lagi dari 65 dengan cara temp=65+(temp%91).

Semua hasilnya akan di masukkan kepada $filename.


- Untuk dekripsi : 
`function decryption(){jamDec=$2 ....}`
jamDec pada fungsi di atas berfungsi untuk mengambil jam pada nama file. Sisanya mirip dengan fungsi enkripsi dengan memainkan index karakter ASCII.

- Untuk menjalankan skrip pada waktu tertentu, maka menggunakan perintah crontab, dengan ketentuan:
`* 1 * * * ~ ~/modul_1/soal4.sh`

# SOAL 5
Untuk menyelesaikan soal nomor 5, maka langkah-langkahnya sebagai berikut:
1. Membuat skrip bash sebagai berikut:
- Menampilkan isi file syslog dengan perintah cat (`cat /var/log/syslog`).
- Menggunakan perintah awk untuk mengambil record yang sudah di cat, dengan ketentuan sebagai berikut:
 tidak mengandung string "sudo" namun mengandung string "cron" maka ketentuannya ( `/cron/ && !/sudo/`), lalu tidak bersifat case sensitive ( `tolower($0) && tolower($0)`), serta jumlah field pada baris kurang dari 13 ( `NF<13` ). Kemudian record dimasukkan dalam file log di direktori /home/[user]/modul1 ( `&>> ~/modul1` ).
Perintah seluruhnya adalah : `cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && tolower($0) ~ !/sudo/' | awk 'NF<13' >> ~/modul1`
2. Untuk menjalankan skrip pada waktu tertentu, maka menggunakan perintah crontab, dengan ketentuan:
2-30/6 * * * * "direktori_file" (`2-30/6 * * * * ~/modul_1/soal5.sh`)
