import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_app/repo/ogrenciler_repo.dart';

import '../models/ogrenci.dart';

class Ogrenciler extends ConsumerWidget {
  const Ogrenciler( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepo = ref.watch(ogrencilerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenciler Sayfası'),
      ),
      body: Column(
        children: [
          PhysicalModel(
            elevation: 20,
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(
                  '${ogrencilerRepo.ogrenciler.length} Öğrenci',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => OgrenciSatiri(
                    ogrencilerRepo.ogrenciler[index]),
                separatorBuilder: (context, index) => Divider(),
                itemCount: ogrencilerRepo.ogrenciler.length),
          )
        ],
      ),
    );
  }
}

class OgrenciSatiri extends ConsumerWidget {
  const OgrenciSatiri(
    this.ogrenci,
     {
    Key? key,
  }) : super(key: key);

  final Ogrenci ogrenci;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepo = ref.watch(ogrencilerProvider);
    bool seviyormu = ogrencilerRepo.seviyorMu(ogrenci);
    return ListTile(
      title: Text('${ogrenci.ad} ${ogrenci.soyad}'),
      leading: IntrinsicWidth(
        child: Text(ogrenci.cinsiyet == 'Erkek' ? '👨🏼‍🦰' : '👸'),
      ),
      trailing: IconButton(
        onPressed: () {
           ref.read(ogrencilerProvider).sev(ogrenci, seviyormu);
        },
        icon: Icon(ogrencilerRepo.seviyorMu(ogrenci)
            ? Icons.favorite
            : Icons.favorite_border),
      ),
    );
  }
}
