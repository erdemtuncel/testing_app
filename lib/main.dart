import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_app/pages/mesajlar_sayfasi.dart';
import 'package:testing_app/pages/ogrenciler_sayfasi.dart';
import 'package:testing_app/pages/ogretmenler_sayfasi.dart';
import 'package:testing_app/repo/mesajlar_repo.dart';
import 'package:testing_app/repo/ogrenciler_repo.dart';
import 'package:testing_app/repo/ogretmenler_repo.dart';

void main() {
  print('main çalıştı');
  runApp(const ProviderScope(child: MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('myapp build çalıştı');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Okul Bilgi Sistemi'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

 /*  OgretmenlerRepo ogretmenler = OgretmenlerRepo();
   OgrencilerRepo ogrenciler = OgrencilerRepo();
   MesajlarRepo mesajlar = MesajlarRepo();*/

  Future<void> _mesajlaraGit(context) async {
    await Navigator.push(context, MaterialPageRoute(
          builder: (context) => const Mesajlar()));

  }

  void _ogrencilereGit(context) {

      Navigator.push(context, MaterialPageRoute(
          builder: (context) => const Ogrenciler()));

  }

  void _ogretmenlereGit(context) {

      Navigator.push(context, MaterialPageRoute(
          builder: (context) => const Ogretmenler()));

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepo = ref.watch(ogrencilerProvider);
    final ogretmenlerRepo = ref.watch(ogretmenlerProvider);
    print('my homepage build çalıştı');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                _ogretmenlereGit(context);
              },
              child: Text('${ogretmenlerRepo.ogretmenler.length} yeni öğretmen'),
            ),
            TextButton(
              child: Text('${ogrencilerRepo.ogrenciler.length} yeni öğrenci'),
              onPressed: () {
                _ogrencilereGit(context);
              },
            ),
            TextButton(
              child: Text('${ref.watch(yeniMesajSayisiProvider)} yeni mesaj'),
              onPressed: () {
                _mesajlaraGit(context);
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Öğrenci Adı'),
            ),
            ListTile(
              title: const Text('Öğrenciler'),
              onTap: () {
                _ogrencilereGit(context);
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Öğretmenler'),
              onTap: () {
               _ogretmenlereGit(context);
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Mesajlar'),
              onTap: () {
                _mesajlaraGit(context);
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
