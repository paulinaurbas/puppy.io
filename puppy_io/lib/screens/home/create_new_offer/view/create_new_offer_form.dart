import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/data/enums/dog_offer_filtring_emuns.dart';
import 'package:puppy_io/widgets/primary_button.dart';
import 'package:puppy_io/helpers/colors/puppy_io_colors.dart';
import 'package:puppy_io/screens/home/create_new_offer/bloc/create_new_offer_bloc.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/tile_with_icon.dart';

class CreateNewOfferForm extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateNewOfferForm());
  }

  static const List<String> breadsList = [
    'Hovawart',
    'Haski',
    'Owczarek niemiecki'
  ];

  static const List<String> ageList = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20"
  ];

  const CreateNewOfferForm({Key? key}) : super(key: key);

  //TODO: Add Provider and split it into page and form files
  //TODO: Add description and images fields
  //TODO: While clicking the button there should be also the localization read
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(LocaleKeys.createNewOffer.tr()),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 16,
                        ),
                        DropDown(
                          breadsList,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 8,
                    child: DropDown(
                      ageList,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: const [
                  Expanded(
                    flex: 7,
                    child: GenderSection(),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const CreateNewOfferButton(),
            ],
          ),
        ));
  }
}

class DropDown extends StatelessWidget {
  const DropDown(this.options);

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewOfferBloc, CreateNewOfferState>(
        builder: (context, state) {
      if (state is CreatingNewOfferState) {
        return FittedBox(
          child: DropdownButton<String>(
            value: (state.breed != null && state.breed!.isNotEmpty)
                ? state.breed
                : null,
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (breed) {
              context.read<CreateNewOfferBloc>().add(
                    DogBreedChanged(breed ?? ''),
                  );
            },
          ),
        );
      } else {
        return Container();
      }
    });
  }
}

class GenderSection extends StatelessWidget {
  const GenderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewOfferBloc, CreateNewOfferState>(
        builder: (context, state) {
      if (state is CreatingNewOfferState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(LocaleKeys.sex.tr()),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: TileWithIcon(
                    PuppyIoColors.genderManColor,
                    state.sex == Sex.male,
                    Icons.male,
                    () {
                      context.read<CreateNewOfferBloc>().add(
                            const DogSexChanged(Sex.male),
                          );
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: TileWithIcon(
                    PuppyIoColors.genderWomenColor,
                    state.sex == Sex.female,
                    Icons.female,
                    () {
                      context.read<CreateNewOfferBloc>().add(
                            const DogSexChanged(Sex.female),
                          );
                    },
                  ),
                ),
              ],
            )
          ],
        );
      } else {
        return Container();
      }
    });
  }
}

class CreateNewOfferButton extends StatelessWidget {
  const CreateNewOfferButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonDescription: LocaleKeys.createNewOfferButton.tr(),
        onPressed: () {
          context.read<CreateNewOfferBloc>().add(
                CreateNewOffer(),
              );
        });
  }
}
