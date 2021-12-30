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
      alignment: Alignment.topLeft,
      children: <Widget>[
        const Image(
          image: AssetImage('assets/images/backgroun_main_scree.png'),
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  const BackButton(),
                  const SizedBox(
                    height: 52,
                  ),
                  AboutDogCard(dog: dog),
                ],
              )),
        ),
      ],
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new, //TODO: change icon
          size: 25,
        ),
      ),
    );
  }
}
