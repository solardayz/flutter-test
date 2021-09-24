import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
