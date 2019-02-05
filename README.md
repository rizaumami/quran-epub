# <p align="center">quran-epub
## <p align="center">Al Qur'an Terjemah Bahasa Indonesia

`quran-epub` adalah sebuah skrip `bash` untuk memotong dan menggabungkan berkas Al Qur'an dan terjemah dari [http://tanzil.net](http://tanzil.net) menjadi berkas markdown yang kemudian akan diubah oleh `pandoc` menjadi berkas [EPUB](https://en.wikipedia.org/wiki/EPUB).

Skrip ini tidak mengolah apapun pada teks Qu'ran dan atau terjemahnya. Misal Anda akan menemukan bahwa pada ayat pertama tiap surat selalu diawali kalimat _bismillahirrahmanirrahim_ yang adalah tidak semestinya.

Pengguna `quran-epub` janganlah menjadikan berkas EPUB yang dihasilkannya sebagai acuan utama, melainkan hanya sebagai pustaka penambah saja.

### Penggunaan

- Gandakan repo `quran-epub`

  ```bash
  git clone https://github.com/rizaumami/quran-epub
  ```
- Pasang `awk` dan `pandoc`. Misal untuk sistem berdasar Debian bisa menggunakan perintah berikut:

  ```bash
  sudo apt install awk pandoc
  ```

- Jalankan berkas `mkepub -h` untuk melihat cara menggunakan skrip.

  ```
  Skrip ini akan membantu Anda membuat berkas EPUB (buku elektronik) Al Qur'an
  disertai terjemah bahasa Indonesia.

  Berkas teks Al Qur'an dan terjemah diperoleh dari http://tanzil.net.
  Hal berkaitan dengan tipografi Al Qur'an, terjemah dan atau lainnya yang
  bukan disebabkan kesalahan skrip ini silakan merujuk ke laman tersebut.

  Cara menggunakan: mkepub <PILIHAN>

  PILIHAN:
    TEKS AL QUR'AN
    - s, simple               Sederhana
    - se, simple-enhanced     Sederhana dengan tanda baca dan simbol
    - sm, simple-minimal      Sederhana dengan sedikit tanda baca dan simbol
    - sc, simple-clean        Sederhana tanpa tanda baca dan simbol
    - u, uthmani              Usmani, mushaf Madinah
    - um, uthmani-minimal     Usmani dengan sedikit tanda baca dan simbol

    Jika tidak ada teks Qur'an yang dipilih maka akan menggunakan teks Qur'an
    Simple Enhanced.

    TERJEMAHAN
    - id, indonesian          Kementerian Agama Republik Indonesia
    - m, muntakhab            Muhammad Quraish Shihab
    - j, jalalayn             Tafsir Jalalayn

    Jika tidak ada terjemahan yang dipilih maka akan menyertakan ketiga teks
    terjemahan di atas.

    HURUF
    - me, me_quran            me_quran
    - pdms                    _PDMS_Saleem_QuranFont
    - sche, scheherazade      Scheherazade Regular
    - ut                      KFGQPC Uthman Taha Naskh

    Jika tiada huruf yang dipilih maka akan digunakan _PDMS_Saleem_QuranFont
    kecuali untuk teks Qur'an Usmani (uthmani dan uthmani-minimal).
    Teks Qur'an Usmani akan selalu menggunakan huruf me_quran kecuali
    ditentukan lain.

    - -h, --help              Tampilkan bantuan ini

  Jika memberikan lebih dari satu kali tiap entri PILIHAN, maka argumen
  terakhirlah yang akan dipakai. Misal menjalankan perintah:

    mkepub u m sc

  Walau telah memasukkan argumen u untuk mushaf Madinah, namun karena kemudian
  memberikan juga argumen sc, maka teks Qur'an yang dipakai adalah Simple Clean.

  Contoh penggunaan:
    - mkepub
      Membuat EPUB dengan teks Qur'an Simple Enhanced, huruf PDMS dan semua
      terjemah.
    - mkepub u
      Membuat EPUB dengan teks Qur'an Usmani, huruf me_quran dan semua terjemah.
    - mkepub u id
      Membuat EPUB dengan teks Qur'an Usmani, huruf me_quran dan terjemah dari
      Kementerian Agama Republik Indonesia.
    - mkepub u j ut
      Membuat EPUB dengan teks Qur'an Usmani, huruf KFGQPC Uthman Taha Naskh
      dan terjemah tafsir Jalalayn.
  ```

### Sumber

- quran-simple-clean.txt \
  diunduh: 2019-01-28 01:20:38 \
  dari: http://tanzil.net/download/ \
  sha1: 2bc7e1dc2075410145ddd8b6935771f007d2bc98

- quran-simple-enhanced.txt \
  diunduh: 2019-01-28 01:20:38 \
  dari: http://tanzil.net/download/ \
  sha1: ea84b95563201fd618bf895fde83a5c646122d96

- quran-simple-min.txt \
  diunduh: 2019-01-28 01:20:38 \
  dari: http://tanzil.net/download/ \
  sha1: 14ce6e96bdc548ad8509b86aace46941dec5d887

- quran-simple.txt \
  diunduh: 2019-01-28 01:20:38 \
  dari: http://tanzil.net/download/ \
  sha1: 16d8abb30a4ace3e457bf99e3693fd36a9dfa0d7

- quran-uthmani-min.txt \
  diunduh: 2019-01-28 01:20:38 \
  dari: http://tanzil.net/download/ \
  sha1: f403eec72fbea559e6b94de3ed945c5527128ea3

- quran-uthmani.txt \
  diunduh: 2019-01-28 01:20:38 \
  dari: http://tanzil.net/download/ \
  sha1: 66c40e21add91b1106f07d852079ae6692099a36

- id.indonesian.txt \
  diunduh: 2019-01-28 01:27:25 \
  dari: http://tanzil.net/trans/?transID=id.indonesian&type=txt-2 \
  sha1: 24ec5758cad810d3500ca0410051d9495a02c61a

- id.jalalayn.txt \
  diunduh: 2019-01-28 01:27:25 \
  dari: http://tanzil.net/trans/?transID=id.jalalayn&type=txt-2 \
  sha1: 2574912abd9d13219318b34520115bfa1598d6d5

- id.muntakhab.txt \
  diunduh: 2019-01-28 01:27:25 \
  dari: http://tanzil.net/trans/?transID=id.muntakhab&type=txt-2 \
  sha1: 54d42a8152a6c3089909915c0f0e08dd6d51ccca

- me_quran_volt_newmet.ttf \
  diunduh: 2019-01-28 02:01:04 \
  dari: https://launchpad.net/~sabily.team/+archive/ubuntu/ppa/+files/ttf-me-quran_1.003-5~ppa1_all.deb \
  sha1: 98bbd32a4db4ef3f24283dc012fc991452c80eb7

- _PDMS_Saleem_QuranFont.ttf \
  diunduh: 2019-01-28 02:01:04 \
  dari: http://quran.mursil.com/Web-Print-Publishing-Quran-Text-Graphics-Fonts-and-Downloads/fonts-optimized-for-quran \
  sha1: 6317a8db41ac979d58b6f0577fba52223c608ef4

- Scheherazade-Regular.ttf \
  diunduh: 2019-01-28 02:01:04 \
  dari: http://ftp.debian.org/debian/pool/main/f/fonts-sil-scheherazade/fonts-sil-scheherazade_2.100-1_all.deb \
  sha1: 19d60aa144bb703f0c7535e3b34e926e0cae954d

- UthmanTN1 Ver10.otf \
  diunduh: 2019-01-28 02:01:04 \
  dari: http://fonts.qurancomplex.gov.sa/wp02/wp-content/uploads/2012/06/UthmanTN1-Ver10.zip \
  sha1: 154d7299c366c1e24801fc832e2ecec25c28b096

- Gambar sampul dari [http://images.qurancomplex.gov.sa](http://images.qurancomplex.gov.sa) (kini gambar tidak ditemukan di laman tersebut)

### Lisensi

Lisensi bisa dibaca pada berkas [LICENSE](./LICENSE) dan hanya untuk berkas-berkas di luar map **src**. \
Semua hak cipta dan kepemilikan berkas-berkas yang tertera di dalam map **src** adalah milik dari sumber/pemilik aslinya.
