import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_app/services/data_service.dart';
import '../models/ogretmen.dart';

class OgretmenlerRepo extends ChangeNotifier{

  List<Ogretmen> ogretmenler = [
    Ogretmen('Ahmet', 'Demir', 34, 'Erkek'),
    Ogretmen('Mehmet', 'Güzel',32,'Erkek'),
    Ogretmen('Fatma', 'Türkmen', 32, 'Kadın'),
    Ogretmen('Filiz', 'Saygı', 25, 'Kadin')];

  OgretmenlerRepo(this.dataService);
  final DataService dataService;

  Future<void> indir() async {
    Ogretmen ogretmen = await dataService.OgretmenIndir();

    ogretmenler.add(ogretmen);
    notifyListeners();
  }
}

final ogretmenlerProvider = ChangeNotifierProvider((ref) => OgretmenlerRepo(ref.watch(dataServiceProvider)));

