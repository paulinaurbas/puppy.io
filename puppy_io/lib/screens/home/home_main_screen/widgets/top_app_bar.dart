// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:puppy_io/screens/home/settings/view/settings_page.dart';
import 'package:puppy_io/screens/home/create_new_offer/view/create_new_offer_page.dart';

class TopAppBar extends StatelessWidget {
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
                    height: 40,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          SettingsPage.route(),
                        );
                      },
                      child: const Icon(
                        Icons.app_settings_alt_outlined, //TODO: change icon
                        size: 25,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CreateNewOfferPage.route(),
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      size: 25,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
