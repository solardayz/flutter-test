import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                  color: Colors.blue[300]
                ),
              ),
            ),
            Form(
              child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.blue,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 15.0
                      )
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Enter ID'
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Enter Password'
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ButtonTheme(
                          minWidth: 100.0,

                          child: ElevatedButton(
                              onPressed: (){
                                print('login');
                              },
                              child: Text('Login')
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      )
    );
  }
}
