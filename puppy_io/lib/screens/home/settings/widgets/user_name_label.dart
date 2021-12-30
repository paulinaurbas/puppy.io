import 'package:flutter/material.dart';

class UserNameLabel extends StatelessWidget {
  final String userName;
  final String title;

  const UserNameLabel({required this.userName, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title + ':',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          userName,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
