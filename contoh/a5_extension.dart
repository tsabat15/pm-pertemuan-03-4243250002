extension FormatRupiah on int {
  String get rupiah {
    final pola = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp${toString().replaceAllMapped(pola, (m) => '.')}';
  }
}

extension Kapital on String {
  String get kapital =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}

void main() {
  print(1250000.rupiah); // Rp1.250.000
  print('pemrograman'.kapital); // Pemrograman
}
