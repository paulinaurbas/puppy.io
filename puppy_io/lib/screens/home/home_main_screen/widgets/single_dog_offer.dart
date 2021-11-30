import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/helpers/colors/puppy_io_colors.dart';

class SingleDogOffer extends StatelessWidget {
  final Dog _dog;

  const SingleDogOffer(this._dog);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: PuppyIoColors.mainPuppyIoColor, width: 2),
        ),
        child: Row(
          children: [
            DogNameAndAge(
              name: _dog.name,
              age: _dog.age,
              icon: Icons.male,
            ),
            const Spacer(),
            DogPhoto(
              photoUrl: _dog.photoUrl,
            ),
          ],
        ),
      ),
    );
  }
}

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
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.age.tr() + ': ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                age.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 32,),
          Icon(icon),
        ],
      ),
    );
  }
}
