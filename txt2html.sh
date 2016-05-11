#!/bin/bash

# jenis teks qur'an yang akan digunakan
QURAN=quran-simple.txt
map_tmp="$(mktemp -d)"

# array nama-nama surat
NAMA_SURAT=( . Al-Fatihah Al-Baqarah Ali-Imran An-Nisaa\' Al-Maaidah \
  Al-An\'aam Al-A\'raaf Al-Anfaal At-Taubah Yunus Huud Yusuf Ar-Ra\'d Ibrahim \
  Al-Hijr An-Nahl Al-Israa\' Al-Kahfi Maryam Thaahaa Al-Anbiyaa\' Al-Hajj \
  Al-Mukminuun An-Nuur Al-Furqaan Ash-Shu\'araa An-Naml Al-Qashash Al-Ankabuut \
  Ar-Ruum Luqman As-Sajdah Al-Ahzaab Saba\' Faathir Yasiin As-Shaaffaat Shaad \
  Az-Zumar Al-Ghaafir Fushshilat Asy-Syuura Az-Zukhruf Ad-Dukhaan Al-Jaatsiyah \
  Al-Ahqaaf Muhammad Al-Fath Al-Hujuraat Qaaf Adz-Dzaariyat Ath-Thur An-Najm \
  Al-Qamar Ar-Rahmaan Al-Waaqi\'ah Al-Hadiid Al-Mujaadilah Al-Hasyr \
  Al-Mumtahanah Ash-Shaff Al-Jumu\'ah Al-Munaafiquun At-Taghaabuun Ath-Thaalaq \
  At-Tahrim Al-Mulk Al-Qalam Al-Haaqqah Al-Ma\'aarij Nuuh Al-Jin Al-Muzzammil \
  Al-Muddatstsir Al-Qiyaamah Al-Insaan Al-Mursalaat An-Naba\' \
  An-Naazi\'aat \'Abasa At-Takwir Al-Infithaar Al-Mutaffifin Al-Insyiqaaq \
  Al-Buruuj Ath-Thaariq Al-A\'laa Al-Ghaashiyah Al-Fajr Al-Balad Asy-Syams \
  Al-Lail Ad-Dhuhaa "Alam Nasyrah" At-Tiin Al-\'Alaq Al-Qadr Al-Bayyinah \
  Al-Zalzalah Al-\'Aadiyaat Al-Qaari\'ah At-Takaatsur Al-\'Ashr Al-Humazah \
  Al-Fiil Quraisy Al-Maa\'uun Al-Kautsar Al-Kaafiruun An-Nashr Al-Lahab \
  Al-Ikhlaas Al-Falaq An-Naas )

# beri tag pada tiap baris
sed 's|^|<p class=\"no-ayat\">-- ﴾ |g;s/|/ ﴿ --<\/p><p class=\"ayat\">/2;s|$|</p>|g' ./Source/$QURAN > $map_tmp/$QURAN
sed 's|^|<p><i> |g;s|$|</i></p>|g' ./Source/id.indonesian.txt > $map_tmp/id.indonesian.txt
sed 's|^|<p> |g;s|$|</p>|g' ./Source/id.muntakhab.txt > $map_tmp/id.muntakhab.txt
sed 's|^|<p> |g;s|$|</p>|g' ./Source/id.jalalayn.txt > $map_tmp/id.jalalayn.txt

# gabungkan berkas dengan urutan al qur'an -> terjemah depag -> terjemah quraish shihab -> tafsir jalalayn
paste -d '\n' $map_tmp/$QURAN $map_tmp/id.indonesian.txt $map_tmp/id.muntakhab.txt $map_tmp/id.jalalayn.txt > $map_tmp/merged-$QURAN

# pilah hasil penggabungan berdasar nomor surat
for i in {1..114} ; do
  # buat berkas berisi header html
  echo '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
 "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title></title>
  <link href="../Styles/stylesheet.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1 class="surat"></h1>' > $map_tmp/$i.html

  # pisahkan tiap surat
  grep " $i|" $map_tmp/merged-$QURAN >> $map_tmp/$i.html

  # beri judul
  sed -i "s|<title>|<title>${NAMA_SURAT[$i]}|g" $map_tmp/$i.html
  sed -i "s|</h1>|${NAMA_SURAT[$i]}</h1>|g" $map_tmp/$i.html

  # hapus nomor ayat
  sed -i 's/"ayat">.*|/"ayat">/g' $map_tmp/$i.html

  # beri pemisah antar ayat/terjemah
  sed -i "s/^<p><i> $i.*|/<p style=\"text-align: center\">* * *<\/p>\n<p><i>/g" $map_tmp/$i.html
  sed -i "s/^<p> $i.*|/<p style=\"text-align: center\">* * *<\/p>\n<p>/g" $map_tmp/$i.html

  # tutup tag html dalam berkas
  sed -i 's/|/:/g' $map_tmp/$i.html
  echo '</body>
</html>' >> $map_tmp/$i.html
done

rm $map_tmp/*.txt

# pindahkan map sementara ke direktori script ini dijalankan
rm -r ./OEBPS/Text
mv $map_tmp ./OEBPS/Text

# selesai
echo "Al Qur'an berupa berkas html dapat ditemukan di map OEPBS/Text"

