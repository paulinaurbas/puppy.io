import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/screens/autorization_screen/authentication/bloc/authentication_bloc.dart';
import 'package:puppy_io/screens/home/dog_details/widgets/down_photo.dart';
import 'package:puppy_io/screens/home/settings/widgets/profile_card.dart';
import 'package:puppy_io/widgets/custom_app_bar.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          Column(
            children: [
              const SizedBox(
                height: 38,
              ),
              const PuppyIoBackButton(),
              ProfileCard(
                child: Container(),
              ),
            ],
          ),
        ),
        Center(
          child: ElevatedButton(
            child: Text(LocaleKeys.logout.tr()),
            onPressed: () {
              context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
            },
          ),
        ),
      ],
    );
  }
}
