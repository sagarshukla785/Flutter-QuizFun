import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  const CircularIcon({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.black,
        size: 16.0,
      ),
    );
  }
}
