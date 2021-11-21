import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonDescription;

  const PrimaryButton({required this.onPressed, required this.buttonDescription});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          buttonDescription,
          style:
          const TextStyle(fontSize: 14, color: Colors.black, letterSpacing: 0.8),
        ),
      ),
      color: Colors.amber,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      onPressed: onPressed,
      disabledColor: Colors.grey,
    );
  }
}