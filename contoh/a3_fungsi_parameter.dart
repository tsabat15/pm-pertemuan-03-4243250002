// Parameter posisional wajib
int luasPersegi(int sisi) {
  return sisi * sisi;
}

// Arrow function: badan fungsi berupa satu ekspresi
double luasLingkaran(double r) => 3.14159 * r * r;

// Parameter posisional opsional: [ ]
String sapa(String nama, [String? gelar]) =>
    gelar == null ? 'Halo, $nama' : 'Halo, $gelar $nama';

// Parameter bernama: { }, boleh punya nilai default
String formatHarga(int harga, {String mataUang = 'Rp', bool pemisah = true}) {
  final angka = pemisah ? _beriTitik(harga) : harga.toString();
  return '$mataUang$angka';
}

// Parameter bernama wajib: required
void daftarMk({required String kode, required int sks}) =>
    print('$kode ($sks SKS) didaftarkan');

// Fungsi bantu "privat" (diawali _), hanya terlihat di berkas ini
String _beriTitik(int n) {
  final s = n.toString();
  final buf = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return buf.toString();
}

void main() {
  print(luasPersegi(4)); // 16
  print(luasLingkaran(2).toStringAsFixed(2)); // 12.57
  print(sapa('Butet')); // Halo, Butet
  print(sapa('Butet', 'Dr.')); // Halo, Dr. Butet
  print(formatHarga(1250000)); // Rp1.250.000
  print(formatHarga(5000, pemisah: false)); // Rp5000
  daftarMk(sks: 3, kode: '3KOM40215'); // urutan argumen bernama bebas
}
