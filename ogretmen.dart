
void main() {
  List<Ogretmen> ogretmen = [
    Ogretmen('Ali', 44),
    IngilizceOgretmeni('verbs', 'Erdem', 43),
  ];

  for (final o in ogretmen) {
    o.merhabaDe();
  }
  final erdemogretmen = Ogretmen('Erdem', 44);
  final yusuf = Ogrenci<Ogretmen>(erdemogretmen);
  yusuf.selam();
}

class Ogrenci<T extends Ogretmen> {

  T gozetmen;

  Ogrenci(this.gozetmen);

  void selam() {
    print('Selam');
    gozetmen.merhabaDe();
  }
}

class Ogretmen {
  String ad;
  int yas;

  Ogretmen(this.ad, this.yas);

  void merhabaDe() {
    print('Merhaba Ben $ad öğretmen. $yas yaşındayım.');
  }
}

class IngilizceOgretmeni extends Ogretmen {
  String chapter;

  IngilizceOgretmeni(this.chapter, String name, int yas) : super(name, yas);

  @override
  void merhabaDe() {
    // TODO: implement merhabaDe
    super.merhabaDe();
    print('I wat at $chapter');
  }
}