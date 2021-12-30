import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/helpers/encode_query_parameters.dart';
import 'package:puppy_io/widgets/outline_button.dart';
import 'package:puppy_io/widgets/photo_in_frame.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutDogCard extends StatelessWidget {
  final DogOffer dog;

  AboutDogCard({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              height: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DogNameAndAge(
                        name: dog.name,
                        age: dog.age,
                        icon: Icons.male,
                      ),
                    ],
                  ),
                  DogDescription(dog.description),
                  const Spacer(),
                  PuppyIoOutlineButton(
                    buttonDescription: LocaleKeys.contactWithOwner.tr(),
                    onPressed: () {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: dog.ownerEmailAddress,
                        query: encodeQueryParameters(
                          <String, String>{
                            'subject': LocaleKeys.iWantAdoptYourDog.tr(),
                            'body': LocaleKeys.iWantAdoptYourDogMessage.tr(),
                          },
                        ),
                      );

                      launch(emailLaunchUri.toString());
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  )
                ],
              ),
            ),
          ),
          PhotoInFrame(dog.photoUrl.first),
        ],
      ),
    );
  }
}


class DogDescription extends StatelessWidget {
  const DogDescription(this.description);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        description,
        textAlign: TextAlign.left,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(icon),
            ],
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
        ],
      ),
    );
  }
}
