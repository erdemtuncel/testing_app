class Ogrenci {
  final String ad;
  int _yas;

  String? okulu;
  late String adres;

  void merhabaDe() {
    print('Merhaba, ben $ad, $_yas yaşındayım');
    print('Okulum: $okulu');
    print('Adres: $adres');
  }


  Ogrenci(this.ad, int y) : _yas = y ;

  Ogrenci.onSekiz(String ad) : this(ad, 18);

  factory Ogrenci.yusuf() {
    return Ogrenci.onSekiz('Yusuf');
  }

  void dogumgununuKutla() {
    _yas += 1;
  }

}