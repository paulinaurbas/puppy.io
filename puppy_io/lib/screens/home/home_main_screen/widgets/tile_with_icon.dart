import 'package:flutter/material.dart';

class TileWithIcon extends StatelessWidget {
  TileWithIcon(
    this.color,
    this.isSelected,
    this.icon,
    this.onChanged,
  );

  final Color color;
  final bool isSelected;
  final IconData icon;
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
          child: Icon(icon),
        ),
      ),
    );
  }
}
