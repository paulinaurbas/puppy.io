import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:puppy_io/data/enums/dog_offer_filtring_emuns.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/helpers/colors/puppy_io_colors.dart';
import 'package:puppy_io/screens/home/create_new_offer/bloc/create_new_offer_bloc.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/tile_with_icon.dart';
import 'package:puppy_io/widgets/primary_button.dart';

class CreateNewOfferForm extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateNewOfferForm());
  }


  static List<String> breedList = [
    LocaleKeys.borderCollie,
    LocaleKeys.jackRussellTerrier,
    LocaleKeys.pug,
    LocaleKeys.chineseCrestedDog,
    LocaleKeys.rottweiler,
    LocaleKeys.beagle,
    LocaleKeys.cavalierKingCharlesSpaniel,
    LocaleKeys.longHairedChihuahua,
    LocaleKeys.englishBulldog,
    LocaleKeys.goldenRetriever,
    LocaleKeys.polishWantedHound,
    LocaleKeys.frenchBulldog,
    LocaleKeys.miniatureSchnauzer,
    LocaleKeys.siberianHusky,
    LocaleKeys.americanStaffordshireTerrier,
    LocaleKeys.westHighlandWhiteTerrier,
    LocaleKeys.berneseMountainDog,
    LocaleKeys.yorkshireTerrier,
    LocaleKeys.labradorRetriever,
    LocaleKeys.germanShepherd,
    LocaleKeys.crossbreed,
    LocaleKeys.different,
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
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: NameTextField(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            Text(LocaleKeys.breed.tr()),
                            const SizedBox(
                              height: 16,
                            ),
                            BreedDropDown(
                              breedList,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            Text(LocaleKeys.age.tr()),
                            const SizedBox(
                              height: 16,
                            ),
                            const AgeDropDown(
                              ageList,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: DescriptionTextField(),
                      )
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
                  Row(
                    children: const [
                      Expanded(
                        flex: 7,
                        child: PictureTextField(0),
                      ),
                      Expanded(
                        flex: 7,
                        child: PictureTextField(1),
                      ),
                      Expanded(
                        flex: 7,
                        child: PictureTextField(2),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CreateNewOfferButton(),
                ],
              ),
            )));
  }
}

class BreedDropDown extends StatelessWidget {
  BreedDropDown(this.options);

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateNewOfferBloc, CreateNewOfferState>(
        listener: (context, state) {
      if (state is SuccessfulCreatedOfferState) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      if (state is CreatingNewOfferState) {
        return FittedBox(
          child: DropdownButton<String>(
            value: (state.breed != null && state.breed!.isNotEmpty)
                ? state.breed
                : null,
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.tr()),
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

class AgeDropDown extends StatelessWidget {
  const AgeDropDown(this.options);

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewOfferBloc, CreateNewOfferState>(
        builder: (context, state) {
      if (state is CreatingNewOfferState) {
        return FittedBox(
          child: DropdownButton<int>(
            value: (state.age != null) ? state.age : 0,
            items: options.map((String value) {
              return DropdownMenuItem<int>(
                value: int.parse(value),
                child: Text(value),
              );
            }).toList(),
            onChanged: (age) {
              context.read<CreateNewOfferBloc>().add(
                    DogAgeChanged(age ?? 0),
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
        onPressed: () async {
          final Position position = await Geolocator.getCurrentPosition();
          final localization = [position.latitude, position.longitude];
          context
              .read<CreateNewOfferBloc>()
              .add(DogLocalizationChanged(localization));
          context.read<CreateNewOfferBloc>().add(
                CreateNewOffer(),
              );
        });
  }
}

class NameTextField extends StatefulWidget {
  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 8),
      child: BlocBuilder<CreateNewOfferBloc, CreateNewOfferState>(
        builder: (context, state) {
          if (state is CreatingNewOfferState) {
            if (myController.text != state.name) {
              myController.text = state.name ?? '';
              myController.selection = TextSelection.fromPosition(TextPosition(offset: myController.text.length));
            }
            return TextField(
              controller: myController,
              key: const Key('createNowOfferForm_nameInput_textField'),
              onChanged: (name) {
                context.read<CreateNewOfferBloc>().add(DogNameChanged(name));
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black),
                ),
                hintStyle: TextStyle(color: Colors.grey[800]),
                labelText: LocaleKeys.dogName.tr(),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class DescriptionTextField extends StatefulWidget {
  @override
  State<DescriptionTextField> createState() => _DescriptionTextFieldState();
}

class _DescriptionTextFieldState extends State<DescriptionTextField> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 8),
      child: BlocBuilder<CreateNewOfferBloc, CreateNewOfferState>(
        builder: (context, state) {
          if (state is CreatingNewOfferState) {
            if (myController.text != state.description) {
              myController.text = state.description ?? '';
              myController.selection = TextSelection.fromPosition(TextPosition(offset: myController.text.length));
            }
            return TextField(
              controller: myController,
              key: const Key('createNowOfferForm_descriptionInput_textField'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (description) => context.read<CreateNewOfferBloc>().add(DogDescriptionChanged(description)),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                      width: 1, style: BorderStyle.solid, color: Colors.black),
                ),
                hintStyle: TextStyle(color: Colors.grey[800]),
                labelText: LocaleKeys.dogDescription.tr(),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class PictureTextField extends StatefulWidget {
  const PictureTextField(this.pictureIndex);

  final int pictureIndex;

  @override
  State<PictureTextField> createState() => _PictureTextFieldState(pictureIndex);
}

class _PictureTextFieldState extends State<PictureTextField> {
  _PictureTextFieldState(this.pictureIndex);
  final int pictureIndex;

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: BlocBuilder<CreateNewOfferBloc, CreateNewOfferState>(
        builder: (context, state) {
          if (state is CreatingNewOfferState) {
            if (myController.text != state.pictures?[pictureIndex]) {
              myController.text = state.pictures?[pictureIndex] ?? '';
              myController.selection = TextSelection.fromPosition(TextPosition(offset: myController.text.length));
            }
            return TextField(
              controller: myController,
              key: const Key('createNowOfferForm_pictureInput_textField'),
              onChanged: (picture) =>
                  context.read<CreateNewOfferBloc>().add(DogPicturesChanged(picture, widget.pictureIndex)),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black),
                ),
                hintStyle: TextStyle(color: Colors.grey[800]),
                labelText: LocaleKeys.dogPicture.tr(),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
