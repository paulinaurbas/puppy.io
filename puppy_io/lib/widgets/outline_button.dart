import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PuppyIoOutlineButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonDescription;

  const PuppyIoOutlineButton({
    required this.onPressed,
    required this.buttonDescription,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          buttonDescription,
          style: const TextStyle(fontSize: 16, color: Colors.black, letterSpacing: 0.8),
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: const BorderSide(
          width: 1,
          color: Colors.amber,
        ),
      ),
    );
  }
}
