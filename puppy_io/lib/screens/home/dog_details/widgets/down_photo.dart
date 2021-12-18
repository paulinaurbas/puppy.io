// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/widgets/custom_app_bar.dart';

import 'about_dog_card.dart';

class DownPhotoAppBar extends StatelessWidget {
  final DogOffer dog;

  const DownPhotoAppBar({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              const PuppyIoBackButton(),
              const SizedBox(
                height: 52,
              ),
              AboutDogCard(dog: dog),
            ],
          ),
        ),
      ),
    );
  }
}

class PuppyIoBackButton extends StatelessWidget {
  const PuppyIoBackButton({Key? key}) : super(key: key);

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
