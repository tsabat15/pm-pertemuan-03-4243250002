void main() {
  final int nilai = 78;

  // if - else if - else
  if (nilai >= 85) {
    print('A');
  } else if (nilai >= 70) {
    print('B');
  } else {
    print('C atau di bawahnya');
  }

  // operator kondisional (ternary)
  final status = nilai >= 60 ? 'Lulus' : 'Mengulang';
  print(status); // Lulus

  // switch statement: di Dart 3 tidak perlu break
  final hari = DateTime.now().weekday;
  switch (hari) {
    case DateTime.saturday || DateTime.sunday:
      print('Libur kuliah');
    case DateTime.friday:
      print('Jumat: ada jeda salat Jumat');
    default:
      print('Hari kuliah biasa');
  }

  // switch expression + relational pattern
  final huruf = switch (nilai) {
    >= 85 => 'A',
    >= 70 => 'B',
    >= 60 => 'C',
    _ => 'E',
  };
  print('Nilai huruf: $huruf'); // Nilai huruf: B
}
