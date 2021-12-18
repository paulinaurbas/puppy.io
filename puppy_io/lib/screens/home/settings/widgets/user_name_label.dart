import 'package:flutter/material.dart';

class UserNameLabel extends StatelessWidget {
  final String userName;
  const UserNameLabel({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Text(userName);
  }
}
