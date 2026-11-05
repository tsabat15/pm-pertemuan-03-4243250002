void main() {
  // forEach: menjalankan fungsi untuk setiap elemen
  final hari = ['Senin', 'Rabu', 'Jumat'];
  hari.forEach(print); // Senin, Rabu, Jumat (tiap baris)

  // for dengan indeks: berguna bila butuh nomor urut
  for (var i = 0; i < hari.length; i++) {
    print('${i + 1}. ${hari[i]}');
  }

  // Menelusuri Map
  final sks = {'Mobile': 3, 'Jaringan': 3, 'Etika': 2};
  for (final e in sks.entries) {
    print('${e.key} = ${e.value} SKS');
  }
  sks.forEach((mk, n) => print('$mk: $n SKS')); // versi forEach

  // Perulangan bersarang: tabel perkalian 1-3
  for (var i = 1; i <= 3; i++) {
    final baris = StringBuffer();
    for (var j = 1; j <= 3; j++) {
      baris.write('${i * j}'.padLeft(4));
    }
    print(baris); //    1   2   3 /    2   4   6 /    3   6   9
  }

  // Pola segitiga bintang
  for (var i = 1; i <= 4; i++) {
    print('*' * i); // *, **, ***, ****
  }
}
