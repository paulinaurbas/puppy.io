import 'package:flutter/material.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:puppy_io/helpers/colors/puppy_io_colors.dart';



class AboutDogCard extends StatelessWidget {
  final DogOffer dog;

  AboutDogCard({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Container(
            decoration: BoxDecoration(
              color: PuppyIoColors.mainPuppyIoColorWithOpacity,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.white38, width: 2),
            ),
            child: Row(
              children: [
                DogNameAndAge(
                  name: dog.name,
                  age: dog.age,
                  icon: Icons.male,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DogNameAndAge extends StatelessWidget {
  final String name;
  final int age;
  final IconData icon;

  const DogNameAndAge({required this.name, required this.age, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.age.tr() + ': ',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                age.toString(),
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Icon(icon),
        ],
      ),
    );
  }
}
