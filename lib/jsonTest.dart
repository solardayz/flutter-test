import 'package:flutter/material.dart';
import 'package:myapp/data/info.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// void main() {
//   runApp(JsonTest(
//     info: fetchInfo(),
//   ));
// }

class JsonTest extends StatelessWidget {
  final Future<Info> info;
  const JsonTest({required this.info});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Test',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('테스트'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<Info>(
            future: info,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '아이디 : ' + snapshot.data!.id.toString(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      '이  름 : ' + snapshot.data!.name.toString(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.hasError}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<Info> fetchInfo() async {
  final response = await http.get('http://localhost:8090/cs/1');

  if (response.statusCode == 200) {
    return Info.fromJson(json.decode(response.body));
  } else {
    throw Exception('정보를 불러오는데 실패했습니다.');
  }
}
