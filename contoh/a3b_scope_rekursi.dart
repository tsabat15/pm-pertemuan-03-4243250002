// ----- Lingkup (scope) variabel -----
const kampus = 'UNIMED'; // tingkat atas: terlihat di seluruh berkas

void cetakKelas() {
  final kelas = 'Kom-A'; // lokal: hanya ada di dalam fungsi ini
  for (var i = 1; i <= 2; i++) {
    final pesan = '$kampus $kelas pertemuan $i'; // lokal blok for
    print(pesan);
  }
  // print(pesan);   // ERROR: pesan sudah di luar blok for
}

// ----- Rekursi: fungsi yang memanggil dirinya sendiri -----
int faktorial(int n) {
  if (n <= 1) return 1; // kasus dasar (base case): berhenti
  return n * faktorial(n - 1); // langkah rekursif: masalah diperkecil
}

int fibonacci(int n) => n < 2 ? n : fibonacci(n - 1) + fibonacci(n - 2);

int jumlahDigit(int n) => n < 10 ? n : n % 10 + jumlahDigit(n ~/ 10);

void main() {
  cetakKelas();
  // print(kelas);   // ERROR: kelas hanya dikenal di cetakKelas()

  print(faktorial(5)); // 120
  print([
    for (var i = 0; i < 8; i++) fibonacci(i),
  ]); // [0, 1, 1, 2, 3, 5, 8, 13]
  print(jumlahDigit(2026)); // 10
}
