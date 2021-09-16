import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      theme: ThemeData(backgroundColor: Colors.blue),
      home: MyPage(),
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
        body: Builder(builder: (BuildContext ctx) {
          return Center(
            child: FlatButton(
              child: Text(
                'Show me',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
              onPressed: () {
                Scaffold.of(ctx).showSnackBar(SnackBar(content: Text('Hello')));
              },
            ),
          );
        }));
  }
}
