int bagi(int a, int b) {
  if (b == 0) throw Exception('Pembagi tidak boleh nol');
  return a ~/ b;
}

void main() {
  try {
    final umur = int.parse('dua puluh'); // melempar FormatException
    print(umur);
  } on FormatException catch (e) {
    print('Format salah: ${e.message}');
  } finally {
    print('Blok finally selalu dijalankan');
  }

  try {
    print(bagi(10, 0));
  } on Exception catch (e) {
    print(e); // Exception: Pembagi tidak boleh nol
  } catch (e, stack) {
    print('Kesalahan lain: $e'); // menangkap semua sisanya
    print(stack);
  }

  // assert hanya aktif saat debug (dart run --enable-asserts)
  const sks = 3;
  assert(sks > 0 && sks <= 6, 'SKS harus 1-6');
}
