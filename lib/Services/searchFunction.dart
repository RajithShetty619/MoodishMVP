import 'package:http/http.dart';
import 'dart:convert';

class SearchFunction {
  Future<String> search() async {
    var data = await get(
        'https://us-central1-moodishtest.cloudfunctions.net/helloWorld?text=american');
    var info = json.decode(data.body);
    print(info);
    return info;
  }
}
