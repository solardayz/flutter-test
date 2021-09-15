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
        title: Text('My First App'),
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
              print('shopping_bag click');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //맨위로 올라감
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('accountName'),
              accountEmail: Text('accountEmail'),
              onDetailsPressed: () {
                print('onDetailsPressed click');
              },
              decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  )),
            )
          ],
        ),
      ),
      body: Text('Hello'),
    );
  }
}
