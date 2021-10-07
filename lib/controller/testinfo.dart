import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:myapp/data/info.dart';

Future<Info> fetchInfo() async {
  final response = await http.get(Uri.parse('http://localhost:8090/cs/1'));

  if (response.statusCode == 200) {
    return Info.fromJson(json.decode(response.body));
  } else {
    throw Exception('정보를 불러오는데 실패했습니다.');
  }
}
