import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/helpers/colors/puppy_io_colors.dart';
import 'package:puppy_io/screens/home/create_new_offer/view/create_new_offer_page.dart';
import 'package:puppy_io/screens/home/dog_details/view/dog_details_screen_page.dart';
import 'package:puppy_io/widgets/dog_photo.dart';

class SingleDogOffer extends StatelessWidget {
  final DogOffer _dog;
  final bool isEditView;

  const SingleDogOffer(
    this._dog, {
    this.isEditView = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isEditView) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return DogDetailsPage(
              arg: DogDetailsArg(_dog),
            );
          }));
        } else {
          //TODO: Navigate to offer ride
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return CreateNewOfferPage(
              arg: OfferArg(_dog),
            );
          }));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: PuppyIoColors.mainPuppyIoColorWithOpacity,
            boxShadow: const [
              BoxShadow(
                color: PuppyIoColors.mainPuppyIoColorWithOpacity,
                blurRadius: 8.0,
                offset: Offset(0.0, 5.0),
              ),
            ],
          ),
          child: Row(
            children: [
              DogNameAndAge(
                name: _dog.name,
                age: _dog.age,
                icon: _dog.gender.contains('Female') ? Icons.female : Icons.male,
              ),
              const Spacer(),
              DogPhoto(
                photoUrl: _dog.photoUrl.first,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DogNameAndAge extends StatelessWidget {
  final String name;
  final int age;
  final IconData icon;

  const DogNameAndAge(
      {required this.name, required this.age, required this.icon});

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
