import 'package:flutter/material.dart';

class DogPhoto extends StatelessWidget {
  final String photoUrl;

  const DogPhoto({required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(photoUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
