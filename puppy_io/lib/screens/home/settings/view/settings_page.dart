import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/screens/autorization_screen/authentication/bloc/authentication_bloc.dart';

class SettingsPage extends StatelessWidget {

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SettingsPage());
  }

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(LocaleKeys.settings.tr()),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(LocaleKeys.logout.tr()),
          onPressed: () {
            context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
          },
        ),
      ),
    );
  }
}
