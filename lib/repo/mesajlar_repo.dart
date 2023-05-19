import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mesaj.dart';

class MesajlarRepo extends ChangeNotifier{

  List<Mesaj> mesajlar= [
    Mesaj('Merhaba', 'Erdem', DateTime.now().subtract(Duration(minutes: 3))),
    Mesaj('Nasılsın:?', 'Erdem', DateTime.now().subtract(Duration(minutes: 2))),
    Mesaj('Merhaba, iyiyim sen?', 'Emel', DateTime.now().subtract(Duration(minutes: 1))),
    Mesaj('Nasıl gidiyor?', 'Emel', DateTime.now()),
  ];

  int yeniMesajSayisi = 4;

}

final mesajlarProvider = ChangeNotifierProvider<MesajlarRepo>((ref) => MesajlarRepo());

class YeniMesajSayisi extends StateNotifier<int> {
  YeniMesajSayisi(int state) : super(state);

  void sifirla() {
    state = 0;
  }
}

final yeniMesajSayisiProvider = StateNotifierProvider<YeniMesajSayisi, int>((ref) => YeniMesajSayisi(4));

