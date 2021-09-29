import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerPw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                ),
                Center(
                  child: Text(
                    '귀뚜라미 냉방 결재 시스템',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[300]),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Form(
                  child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.blue,
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.blue, fontSize: 15.0)),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: controllerId,
                              decoration:
                                  InputDecoration(labelText: 'Enter ID'),
                              keyboardType: TextInputType.text,
                            ),
                            TextField(
                              controller: controllerPw,
                              decoration:
                                  InputDecoration(labelText: 'Enter Password'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            ButtonTheme(
                              child: ElevatedButton(
                                onPressed: () {
                                  print('login');
                                  if (controllerId == 'jhc' &&
                                      controllerPw == 'A') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard()),
                                    );
                                  } else {
                                    // 스낵바 구현할 것
                                    // showSnackBar(BuildContext context);
                                    flutterToast("아이디 또는 패스워드가 틀립니다.");
                                  }
                                },
                                child: Text(
                                  ' Login ',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      wordSpacing: 50.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          );
        },
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
// void showSnackBar(BuildContext context){
//   Scaffold.of(context).showSnackBar(
//     SnackBar(content:
//       Text('아이디 또는 패스워드가 틀립니다.',
//         textAlign: TextAlign.center,
//       ),
//       duration: Duration(seconds: 2),
//       backgroundColor: Colors.blue,
//     )
//   );
// }
