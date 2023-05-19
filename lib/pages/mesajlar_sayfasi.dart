import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_app/repo/mesajlar_repo.dart';

class Mesajlar extends ConsumerStatefulWidget {
  const Mesajlar({Key? key}) : super(key: key);

  @override
  _MesajlarState createState() => _MesajlarState();
}

class _MesajlarState extends ConsumerState<Mesajlar> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero).then((value) => ref.read(yeniMesajSayisiProvider.notifier).sifirla());

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final mesajlarRepo = ref.watch(mesajlarProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesalar Sayfası'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mesajlarRepo.mesajlar.length,
              
              itemBuilder: (context, index) {
                //bool benMiyim = Random().nextBool();
                return Align(
                  alignment:
                      mesajlarRepo.mesajlar[index].gonderen == 'Erdem' ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        color: Colors.green.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Text(mesajlarRepo.mesajlar[index].yazi),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 10, 5, 18),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(border: InputBorder.none,),
                          keyboardAppearance: Brightness.light,
                          keyboardType: TextInputType.text,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 15, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Gönder');
                    },
                    child: Text('Gönder'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
