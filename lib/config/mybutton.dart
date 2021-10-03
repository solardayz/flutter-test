import 'package:flutter/material.dart';

import '../dashboard.dart';

class MyButton extends StatelessWidget {
  const MyButton(this.image, this.text, this.color, this.radius, this.onPressed);

  final Widget image;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              '$text',
              style: TextStyle(color: color, fontSize: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
