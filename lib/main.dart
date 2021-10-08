import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'data/info.dart';
import 'jsonTest.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      theme: ThemeData(backgroundColor: Colors.blue),
      // home: MyPage(),
      home: Login(),
      // home: JsonTest(info: fetchInfo()),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('냉방사 통합 결재 시스템'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blue[200],
        // leading: IconButton( drawer 적용을 위해 주석 처리
        //   icon: Icon(Icons.menu),
        //   onPressed: () {
        //     print('menu click');
        //   },
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search click');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //맨위로 올라감
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('홍길동'),
              accountEmail: Text('hong@krb.co.kr'),
              onDetailsPressed: () {
                print('onDetailsPressed click');
              },
              decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text('Home'),
              // subtitle: Text('Main'),
              dense: true,
              onTap: () {
                print('onTap');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.post_add_sharp,
                color: Colors.grey,
              ),
              title: Text('결재예정'),
              // subtitle: Text('Main'),
              onTap: () {
                print('결재예정');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.approval,
                color: Colors.grey,
              ),
              title: Text('미결재'),
              // subtitle: Text('Main'),
              onTap: () {
                print('미결재');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.approval_sharp,
                color: Colors.grey,
              ),
              title: Text('완료결재'),
              // subtitle: Text('Main'),
              onTap: () {
                print('완료결재');
              },
              // trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Center(
            child: TextButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15.0)),
                foregroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                flutterToast('TextButton');
              },
              child: Text('Toast'),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15.0)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                // backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                flutterToast('ElevatedButton');
              },
              child: Text('Toast'),
            ),
          ),
          Center(
            child: OutlinedButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15.0)),
                foregroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                flutterToast('OutlinedButton');
              },
              child: Text('Toast'),
            ),
          ),
        ],
      ),
    );
    // body: Builder(builder: (BuildContext ctx) {
    //   return Center(
    //     child: FlatButton(
    //       child: Text(
    //         'Show me',
    //         style: TextStyle(color: Colors.white),
    //       ),
    //       color: Colors.red,
    //       onPressed: () {
    //         Scaffold.of(ctx).showSnackBar(SnackBar(content: Text('Hello')));
    //       },
    //     ),
    //   );
    // }));
  }
}

void flutterToast(msg) {
  Fluttertoast.showToast(
      msg: 'Toast $msg',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.amber,
      fontSize: 20.0,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT);
}

Future<Info> fetchInfo() async {
  final response = await http.get(Uri.parse('http://192.168.7.109:8090/cs/2'));
  print(response.statusCode);
  if (response.statusCode == 200) {
    return Info.fromJson(json.decode(response.body));
  } else {
    throw Exception('정보를 불러오는데 실패했습니다.');
  }
}
