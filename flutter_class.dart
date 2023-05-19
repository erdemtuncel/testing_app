
import 'ogrenci.dart';

void main() {
  print('merhaba');

  Ogrenci o1 = Ogrenci('Erdem', 44);
  Ogrenci o2 = Ogrenci('Emel', 37);

  Ogrenci o3 = Ogrenci.yusuf();


  o1.okulu = 'a okulu';
  o2.okulu = 'b okulu';
  o3.okulu = 'c okulu';

  o1.adres = 'İstanbul';
  o2.adres = 'izmir';
  o3.adres = 'Ümraniye';

  o1.merhabaDe();
  o2.merhabaDe();
  o3.merhabaDe();

  o1.dogumgununuKutla();

  o1.merhabaDe();
  o2.merhabaDe();
}