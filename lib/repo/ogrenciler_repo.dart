import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/ogrenci.dart';

class OgrencilerRepo extends ChangeNotifier{
  List<Ogrenci> ogrenciler = <Ogrenci>[
    Ogrenci('Fikret', 'Yılmaz', 16, 'Erkek'),
    Ogrenci('Ferit', 'Korhan', 18, 'Erkek'),
    Ogrenci('Selin', 'Yıldırım', 17, 'Kadın'),
    Ogrenci('Dilek', 'Tuncel', 19, 'Kadın'),
    Ogrenci('Hakan', 'Dağ', 20, 'Erkek')
  ];

  Set<Ogrenci> sevdiklerim = {};

  void sev(Ogrenci ogrenci, bool seviyormu) {
    if(seviyormu) {
      sevdiklerim.remove(ogrenci);
    } else {
      sevdiklerim.add(ogrenci);
    }
    notifyListeners();
  }

  bool seviyorMu(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
   }
}

final ogrencilerProvider = ChangeNotifierProvider<OgrencilerRepo>((ref) => OgrencilerRepo());

