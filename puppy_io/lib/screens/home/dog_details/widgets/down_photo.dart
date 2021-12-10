// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:puppy_io/data/models/dog.dart';

import 'about_dog_card.dart';

class DownPhotoAppBar extends StatelessWidget {
  final DogOffer dog;

  const DownPhotoAppBar({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        const Image(
          image: AssetImage('assets/images/details_backgoround_photo.png'),
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                AboutDogCard(
                  dog: dog,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
