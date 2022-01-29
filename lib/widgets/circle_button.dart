import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;

  const CircleButton(
      @required this.icon, @required this.iconSize, @required this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: Colors.black,
        iconSize: iconSize,
      ),
    );
  }
}
