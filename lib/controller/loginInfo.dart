import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:myapp/data/info.dart';

Future<Info> loginInfo(erpID) async {
  final response =
      await http.get(Uri.parse('http://192.168.7.109:9000/company/$erpID'));
  print('response.statusCode는 ${response.statusCode}');
  if (response.statusCode == 200) {
    return Info.fromJson(json.decode(response.body));
  } else {
    throw Exception('정보를 불러오는데 실패했습니다.');
  }
}
