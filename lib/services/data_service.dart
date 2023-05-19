import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_app/models/ogretmen.dart';
import 'package:http/http.dart' as http;

class DataService {

  final String baseURL = 'https://63e4d6f8c04baebbcdad3b3a.mockapi.io';

  Future<Ogretmen> OgretmenIndir() async {
    
    http.Response response =  await http.get(Uri.parse('$baseURL/ogretmen/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Ogretmen.fromMap(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
}

  Future<void> ogretmenEkle(Ogretmen ogretmen) async {
    final response = await http.post(
      Uri.parse('$baseURL/ogretmen/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ogretmen.toMap()),
    );

    if (response.statusCode == 201) {

      return;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Öğretmen eklenemedi');
    }


  }

}
final dataServiceProvider = Provider((ref) => DataService());