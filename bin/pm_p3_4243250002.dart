import 'dart:io';

/// Tantangan 2: record Tugas ditambah prioritas.
typedef Tugas = ({int id, String judul, bool selesai, String prioritas});

extension Kapital on String {
  String get kapital =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}

/// Urutan tampil prioritas: angka kecil tampil lebih dulu.
const Map<String, int> urutanPrioritas = {
  'Tinggi': 0,
  'Sedang': 1,
  'Rendah': 2,
};

final List<Tugas> daftar = [];
int _idBerikut = 1;

void main() {
  print('=== TODO CLI ===');
  var jalan = true;
  while (jalan) {
    tampilkanMenu();
    final pilihan = baca('Pilih menu');
    try {
      switch (pilihan) {
        case '1':
          tambah(baca('Judul tugas'), bacaPrioritas());
        case '2':
          tampilkan(daftar);
          // Tantangan 3: ringkasan ditampilkan di menu [2].
          final r = ringkasan();
          print(
            'Ringkasan: ${r.selesai}/${r.total} selesai '
            '(${r.persen.toStringAsFixed(0)}%)',
          );
        case '3':
          tandaiSelesai(bacaAngka('ID tugas'));
        case '4':
          hapus(bacaAngka('ID tugas'));
        case '5':
          tampilkan(cari(baca('Kata kunci')), judul: 'Hasil pencarian');
        case '6':
          tampilkan(
            daftar.where((t) => !t.selesai).toList(),
            judul: 'Belum selesai',
          );
        case '7':
          ubahJudul(bacaAngka('ID tugas'), baca('Judul baru'));
        case '0':
          jalan = false;
        default:
          print('Menu tidak dikenal.');
      }
    } on FormatException catch (e) {
      print('Peringatan: ${e.message}');
    }
  }
  print('Sampai jumpa!');
}

void tampilkanMenu() {
  print('''

[1] Tambah  [2] Lihat semua  [3] Tandai selesai
[4] Hapus   [5] Cari         [6] Belum selesai
[7] Ubah judul               [0] Keluar''');
}

String baca(String label) {
  stdout.write('$label: ');
  return (stdin.readLineSync() ?? '').trim();
}

int bacaAngka(String label) {
  final teks = baca(label);
  final angka = int.tryParse(teks);
  if (angka == null) throw FormatException('"$teks" bukan angka.');
  return angka;
}

/// Tantangan 2: membaca prioritas; kosong berarti Sedang.
String bacaPrioritas() {
  final teks = baca('Prioritas (Tinggi/Sedang/Rendah)').toLowerCase().kapital;
  if (teks.isEmpty) return 'Sedang';
  if (!urutanPrioritas.containsKey(teks)) {
    throw FormatException('Prioritas "$teks" tidak dikenal.');
  }
  return teks;
}

void tambah(String judul, String prioritas) {
  if (judul.isEmpty) throw FormatException('Judul tidak boleh kosong.');
  daftar.add((
    id: _idBerikut++,
    judul: judul.kapital,
    selesai: false,
    prioritas: prioritas,
  ));
  print('Tugas ditambahkan.');
}

void tampilkan(List<Tugas> data, {String judul = 'Daftar tugas'}) {
  print('--- $judul (${data.length}) ---');
  if (data.isEmpty) {
    print('(kosong)');
    return;
  }
  // Tantangan 2: urutkan salinan dengan fungsi pembanding, data asli tetap.
  final urut = data.toList()
    ..sort(
      (a, b) => (urutanPrioritas[a.prioritas] ?? 3).compareTo(
        urutanPrioritas[b.prioritas] ?? 3,
      ),
    );
  for (final t in urut) {
    final tanda = t.selesai ? '[x]' : '[ ]';
    final id = t.id.toString().padLeft(3);
    print('$id $tanda ${t.prioritas.padRight(6)} ${t.judul}');
  }
}

int _indeksDari(int id) {
  final i = daftar.indexWhere((t) => t.id == id);
  if (i == -1) throw FormatException('Tugas dengan ID $id tidak ditemukan.');
  return i;
}

void tandaiSelesai(int id) {
  final i = _indeksDari(id);
  final t = daftar[i];
  // Record immutable, jadi dibuat record baru.
  daftar[i] = (id: t.id, judul: t.judul, selesai: true, prioritas: t.prioritas);
  print('"${t.judul}" ditandai selesai.');
}

/// Tantangan 1: mengubah judul, memakai _indeksDari, menolak judul kosong.
void ubahJudul(int id, String judulBaru) {
  final i = _indeksDari(id);
  if (judulBaru.isEmpty) throw FormatException('Judul tidak boleh kosong.');
  final t = daftar[i];
  daftar[i] = (
    id: t.id,
    judul: judulBaru.kapital,
    selesai: t.selesai,
    prioritas: t.prioritas,
  );
  print('Judul diubah menjadi "${judulBaru.kapital}".');
}

void hapus(int id) {
  final t = daftar.removeAt(_indeksDari(id));
  print('"${t.judul}" dihapus.');
}

List<Tugas> cari(String kata) {
  final kunci = kata.toLowerCase();
  return daftar.where((t) => t.judul.toLowerCase().contains(kunci)).toList();
}

/// Tantangan 3: mengembalikan record ringkasan.
({int total, int selesai, double persen}) ringkasan() {
  final total = daftar.length;
  final selesai = daftar.where((t) => t.selesai).length;
  return (
    total: total,
    selesai: selesai,
    persen: total == 0 ? 0 : selesai / total * 100,
  );
}
