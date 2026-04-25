# Tugas Pertemuan 4 - Struktur Kontrol Percabangan

## Identitas

Nama : Nur Fahila Dwi Irfani.D
NIM : IK2411031  
Kelas: Informatika

## Deskripsi

Repository ini berisi tugas praktikum Pemrograman Basis Data Pertemuan 4 tentang implementasi struktur kontrol percabangan menggunakan IF-THEN-ELSE pada MySQL.

## Studi Kasus

Tugas mencakup:

1. Pengecekan status stok
2. Perhitungan diskon
3. Predikat mahasiswa

## File Repository

- kode_sql/kuis_pertemuan4_nim.sql
- laporan/laporan_analisis_pertemuan4_nim.pdf

## Cara Menjalankan

Import file SQL ke phpMyAdmin atau MySQL:

```sql
SOURCE kuis_pertemuan4_nim.sql;
```

Atau jalankan:

```sql
CALL cek_status_stok(4);
CALL hitung_diskon(800000);
CALL cek_predikat_mahasiswa(88);
```

## Output Pengujian

- Status stok: Hampir Habis
- Diskon: 12%
- Predikat: Memuaskan (Lulus)
