typedef Operasi = double Function(double a, double b);

// Higher-order function: menerima fungsi sebagai parameter
double hitung(double a, double b, Operasi op) => op(a, b);

// Fungsi yang mengembalikan fungsi (closure)
int Function() buatPenghitung() {
  var hitungan = 0; // variabel ini "ditangkap" oleh closure
  return () => ++hitungan;
}

void main() {
  final Map<String, Operasi> kalkulator = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    '*': (a, b) => a * b,
  };
  // '!' aman: kunci '*' pasti ada di Map yang baru kita tulis
  print(hitung(6, 3, kalkulator['*']!)); // 18.0
  print(hitung(6, 3, (a, b) => a / b)); // 2.0

  final antrianA = buatPenghitung();
  final antrianB = buatPenghitung();
  print(antrianA()); // 1
  print(antrianA()); // 2
  print(antrianB()); // 1 <- punya hitungan sendiri

  final nilai = [78, 92, 55];
  nilai.sort((a, b) => b.compareTo(a)); // fungsi anonim sebagai pembanding
  print(nilai); // [92, 78, 55]
}
