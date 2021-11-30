import 'package:flutter/material.dart';

class TileWithValue extends StatelessWidget {
  TileWithValue(this.title, this.color, this.isSelected);

  final Color color;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: color),
        color: isSelected ? color : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
