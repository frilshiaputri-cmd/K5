# K5-HUB

## File utama
- **Loader:** [K5_HUB_Loader.lua](./K5_HUB_Loader.lua)
- **Script sumber:** [K5_HUB_REDEEM_UPDATED.txt](./K5_HUB_REDEEM_UPDATED.txt)

## Cara menjalankan
1. Jalankan isi file loader melalui executor/client yang mendukung HTTP request dan `loadstring`.
2. Periksa console untuk pesan `[K5-HUB Loader]` jika UI tidak muncul.
3. Pastikan game sudah selesai dimuat sebelum menjalankan script.

## Catatan troubleshooting
- Jika muncul `loadstring tidak tersedia`, executor yang digunakan tidak mendukung cara pemuatan ini.
- Jika muncul `Tidak bisa mengunduh script`, periksa koneksi dan izin HTTP executor.
- Jika UI berjalan tetapi redeem tidak bekerja, jalur RemoteEvent game mungkin berubah atau tidak tersedia.
- Loader mengambil versi terbaru dari branch `main`; gunakan URL raw yang tercantum di bawah.

## Raw URL
- Loader: https://raw.githubusercontent.com/frilshiaputri-cmd/K5/main/K5_HUB_Loader.lua
- Source: https://raw.githubusercontent.com/frilshiaputri-cmd/K5/main/K5_HUB_REDEEM_UPDATED.txt
