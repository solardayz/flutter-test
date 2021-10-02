import 'package:flutter/material.dart';

import '../dashboard.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              print('ElevatedButton');
            },
            child: Text(
              'Login',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
