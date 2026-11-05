import 'dart:math';

void main() {
  print(pi.toStringAsFixed(4)); // 3.1416
  print(sqrt(144)); // 12.0
  print(pow(2, 10)); // 1024
  print(max(78, 92)); // 92
  print(min(3.5, 2.75)); // 2.75
  print((-7).abs()); // 7
  print(7.6.floor()); // 7
  print(7.2.ceil()); // 8
  print(7.5.round()); // 8
  print(17.clamp(0, 10)); // 10 (dibatasi ke rentang 0-10)

  // Jarak dua titik (Pythagoras)
  double jarak(num x1, num y1, num x2, num y2) =>
      sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  print(jarak(0, 0, 3, 4)); // 5.0

  // Bilangan acak; seed membuat hasil dapat diulang (berguna untuk pengujian)
  final acak = Random(42);
  final nilai = List.generate(5, (_) => 50 + acak.nextInt(51)); // 50-100
  print(nilai);
}
