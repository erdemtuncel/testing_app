import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_app/models/ogretmen.dart';
import 'package:testing_app/services/data_service.dart';

class OgretmenForm extends ConsumerStatefulWidget {
  const OgretmenForm({Key? key}) : super(key: key);

  @override
  _OgretmenFormState createState() => _OgretmenFormState();
}

class _OgretmenFormState extends ConsumerState<OgretmenForm> {

  final Map<String, dynamic> girilen = {};
  final _formKey = GlobalKey<FormState>();
  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yeni Öğretmen'),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Adınız')
                ),
                validator: (value) {
                  if (value?.isNotEmpty != true ) {
                    return 'Ad girmeniz gerekli';
                  }
                },
                onSaved: (newValue) {
                  girilen['ad'] = newValue;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Soyadınız')
                ),
                validator: (value) {
                  if (value?.isNotEmpty != true ) {
                    return 'Soyad girmeniz gerekli';
                  }
                },
                onSaved: (newValue) {
                  girilen['soyad'] = newValue;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Yaş Giriniz')
                ),
                validator: (value) {
                  if(value == null || value.isNotEmpty != true) {
                    return 'Yaş girmeniz gerekir';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Rakamlarla yaş girmeniz gerekli';
                  }
                },
                keyboardType: TextInputType.number,
                onSaved: (newValue) {
                  girilen['yas'] = int.parse(newValue!);
                },
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                    label: Text('Cinsiyet'),
                ),
                items: const [
                  DropdownMenuItem(
                      value: 'Erkek',
                      child: Text('Erkek'),
                    ),
                  DropdownMenuItem(
                    value: 'Kadın',
                    child: Text('Kadın'),
                  ),
                ],
                value: girilen['cinsiyet'],
                onChanged: (value) {
                  setState(() {
                    girilen['cinsiyet'] = value;
                    });
                  },
                validator: (value) {
                  if(value == null) {
                    return 'Lütfen cinsiyet seçiniz';
                  }
                },
              ),
            isSaving ? const Center(child: CircularProgressIndicator()) : ElevatedButton(
                onPressed: () async {
                  final formState = _formKey.currentState;
                  if(formState == null) return;
                  if(formState.validate() == true) {
                    formState.save();
                    print(girilen);
                  }
                  _kaydet();
                },
                child: Text('Kaydet'))

            ],
          ),
              ),
        ),

      ),

    );
  }

  Future<void> _kaydet() async {

    try {
      setState(() {
        isSaving = true;
      });
      final ogretmen = Ogretmen.fromMap(girilen);
      await ref.read(dataServiceProvider).ogretmenEkle(ogretmen);
      Navigator.of(context).pop(true);
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    finally {
      setState(() {
        isSaving = false;
      });
    }

  }
}
