import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:puppy_io/screens/home/settings/bloc/settings_bloc.dart';
import 'package:puppy_io/screens/home/settings/view/settings_form.dart';

class SettingsPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SettingsPage());
  }

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  GetIt getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return getIt.get<SettingsBloc>()
            ..add(
              InitMainScreen(),
            );
        },
        child: const SettingsForm(),
      ),
    );
  }
}
