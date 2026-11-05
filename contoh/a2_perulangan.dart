void main() {
  for (var i = 1; i <= 3; i++) {
    print('Pertemuan $i');
  }

  final matkul = ['Mobile', 'Jaringan', 'AI'];
  for (final mk in matkul) {
    print(mk);
  }

  var saldo = 100000;
  while (saldo >= 30000) {
    saldo -= 30000;
    print('Beli kopi, sisa saldo $saldo'); // 70000, 40000, 10000
  }

  var percobaan = 0;
  do {
    percobaan++; // badan do-while minimal dijalankan sekali
  } while (percobaan < 3);
  print('Percobaan: $percobaan'); // 3

  for (var n = 1; n <= 10; n++) {
    if (n.isEven) continue; // lewati bilangan genap
    if (n > 7) break; // berhenti setelah 7
    print(n); // 1 3 5 7
  }
}
