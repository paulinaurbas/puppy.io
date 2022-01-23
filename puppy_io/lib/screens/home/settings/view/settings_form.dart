import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/screens/autorization_screen/authentication/bloc/authentication_bloc.dart';
import 'package:puppy_io/screens/home/dog_details/widgets/down_photo.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/list_with_offers.dart';
import 'package:puppy_io/screens/home/settings/bloc/settings_bloc.dart';
import 'package:puppy_io/screens/home/settings/widgets/profile_card.dart';
import 'package:puppy_io/screens/home/settings/widgets/user_name_label.dart';
import 'package:puppy_io/widgets/custom_app_bar.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (prev, current) => current is SettingsLoaded,
      builder: (context, state) {
        if (state is SettingsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                Column(
                  children: [
                    const SizedBox(
                      height: 38,
                    ),
                    const PuppyIoBackButton(),
                    ProfileCard(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserNameLabel(userName: state.user.username, title: LocaleKeys.username.tr(),),
                            const SizedBox(height: 16,),
                            UserNameLabel(userName: state.user.email, title: LocaleKeys.email.tr(),),
                            const SizedBox(height: 16,),
                            UserNameLabel(userName: '*********', title: LocaleKeys.password.tr(),),
                          ],
                        ),
                      ),
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
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Text(
                  LocaleKeys.myOffers.tr(),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Expanded(
                child: (state.listWithDogs.isNotEmpty) ? ListWithOffers(
                  listWithDogsOffers: state.listWithDogs,
                  isEditView: true,
                ) : EmptyOffers(),
              )
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
