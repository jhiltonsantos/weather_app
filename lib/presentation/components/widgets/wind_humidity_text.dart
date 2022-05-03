import 'package:flutter/material.dart';

class WindHumidityText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const WindHumidityText({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        Text(text, style: TextStyle(color: color)),
      ],
    );
  }
}
