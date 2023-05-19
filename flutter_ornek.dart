import 'package:english_words/english_words.dart';

void main() {

  print(generateWordPairs().first);

  print('merhaba');
  String? s = null;
  print(s);
  returnEdecek();
  print('main bitti');
}

void returnEdecek() {
  try {
   //return;
   hataFonk();
    print('merhaba try!');

  } on FormatException catch (e) {
        print('format exception hata oldu!');
        rethrow;
  } catch (e) {
    print('hata oldu! $e');
    print(e);
  } finally {
    print('finally');
  }
  print('merhaba main fonk');
  print('merhaba main fonk');
}

void hataFonk() {
  hataKod();
  print('merhaba hata fonk!');
}

void hataKod() {
  //throw Exception('Başka bir hata var!');
  double.parse('bu bir double değildir');
  String? s = null;
  print(s!.length);

  print('merhaba hata kod');
}