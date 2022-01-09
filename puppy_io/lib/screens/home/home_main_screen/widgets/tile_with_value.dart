import 'package:flutter/material.dart';

class TileWithValue extends StatelessWidget {
  const TileWithValue(this.title, this.color, this.isSelected, this.onChanged);

  final Color color;
  final String title;
  final bool isSelected;
  final Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
      child: Container(
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
      ),
    );
  }
}
