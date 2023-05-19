import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_app/repo/ogretmenler_repo.dart';

import '../models/ogretmen.dart';
import 'ogretmen/ogretmen_form.dart';

class Ogretmenler extends ConsumerWidget {
  const Ogretmenler( {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogretmenRepo = ref.watch(ogretmenlerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğretmenler Sayfası'),
      ),
      body: Column(
        children: [
          PhysicalModel(
            elevation: 20,
            color: Colors.white,
            child: Stack (
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Text(
                      '${ogretmenRepo.ogretmenler.length} Öğretmen',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: OgretmenYukle(),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => OgretmenSatiri(ogretmenRepo.ogretmenler[index]),
                separatorBuilder: (context, index) => Divider(),
                itemCount: ogretmenRepo.ogretmenler.length),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final created = await Navigator.of(context).push<bool>(MaterialPageRoute(builder: (context){
              return const OgretmenForm();
            }));
            if (created == true) {
              print('öğretmen eklendi');
              await ref.read(ogretmenlerProvider).indir();
            }
          },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class OgretmenYukle extends StatefulWidget {
  const OgretmenYukle({
    Key? key,
  }) : super(key: key);

  @override
  State<OgretmenYukle> createState() => _OgretmenYukleState();
}

class _OgretmenYukleState extends State<OgretmenYukle> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return Consumer(
      builder: (context, ref, child) {
        return isLoading ? const CircularProgressIndicator() : IconButton(
          icon: const Icon(Icons.download),
          onPressed: () async {
            try {
              setState(() {
                isLoading = true;
              });
              await ref.read(ogretmenlerProvider).indir();

            }
            catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
            }
            finally {
              setState(() {
                isLoading = false;
              });
            }
          },

        );
      }
    );
  }
}

class OgretmenSatiri extends StatelessWidget {
  const OgretmenSatiri(this.ogretmen, {
    Key? key,
  }) : super(key: key);
 final Ogretmen ogretmen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
          title: Text('${ogretmen.ad} ${ogretmen.soyad}'),
          leading: Text(ogretmen.cinsiyet == 'Erkek' ? '👨🏼‍🦰' : '👸'),
        );
  }
}
