import 'package:flutter/material.dart';
import 'package:puppy_io/screens/home/settings/view/settings_form.dart';

class SettingsPage extends StatelessWidget {

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SettingsPage());
  }

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsForm(),
    );
  }
}
