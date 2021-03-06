import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:puppy_io/data/enums/dog_offer_filtring_emuns.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/helpers/colors/puppy_io_colors.dart';
import 'package:puppy_io/screens/home/home_main_screen/bloc/home_screen_main_bloc.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/tile_with_icon.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/tile_with_value.dart';
import 'package:puppy_io/widgets/outline_button.dart';
import 'package:puppy_io/widgets/primary_button.dart';

class OfferFiltering extends StatelessWidget {
  OfferFiltering({Key? key}) : super(key: key);

  List<String> breedList = [
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    BreedDropDown(
                      breedList,
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 8,
                child: AgeFiled(),
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
              SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 8,
                child: OfferDistance(),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchOfferButton(),
              const SizedBox(
                width: 16,
              ),
              CleanResultsOfferButton()
            ],
          ),
        ],
      ),
    );
  }
}

class BreedDropDown extends StatelessWidget {
  const BreedDropDown(this.breadsList);

  final List<String> breadsList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenMainBloc, HomeScreenMainState>(builder: (context, state) {
      if (state is FilteringOfferDogsState) {
        return FittedBox(
          child: DropdownButton<String>(
            value: (state.breed != null && state.breed!.isNotEmpty) ? state.breed : null,
            items: breadsList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.tr()),
              );
            }).toList(),
            onChanged: (username) {
              context.read<HomeScreenMainBloc>().add(
                    DogBreedChanged(username ?? ''),
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

class AgeFiled extends StatelessWidget {
  const AgeFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenMainBloc, HomeScreenMainState>(builder: (context, state) {
      if (state is FilteringOfferDogsState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.age.tr(),
            ),
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
                  child: TileWithValue(
                    LocaleKeys.oneYear.tr(),
                    PuppyIoColors.detailsLightGreen,
                    state.age == Age.oneTwoYears,
                    () {
                      context.read<HomeScreenMainBloc>().add(
                            const DogAgeChanged(Age.oneTwoYears),
                          );
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: TileWithValue(
                    LocaleKeys.treeYears.tr(),
                    PuppyIoColors.detailsDarkerGreen,
                    state.age == Age.threeSixYears,
                    () {
                      context.read<HomeScreenMainBloc>().add(
                            const DogAgeChanged(Age.threeSixYears),
                          );
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                    child: TileWithValue(
                      LocaleKeys.sixYears.tr(),
                      PuppyIoColors.oceanBlue,
                      state.age == Age.sixPlusYear,
                      () {
                        context.read<HomeScreenMainBloc>().add(
                              const DogAgeChanged(Age.sixPlusYear),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class OfferDistance extends StatelessWidget {
  const OfferDistance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenMainBloc, HomeScreenMainState>(builder: (context, state) {
      if (state is FilteringOfferDogsState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.checkOffersFromTheDistrict.tr(),
            ),
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
                  child: TileWithValue(
                    LocaleKeys.tenKm.tr(),
                    PuppyIoColors.detailsLightGreen,
                    state.distance == Distance.tenKm,
                    () {
                      context.read<HomeScreenMainBloc>().add(
                            const DogDistanceChanged(Distance.tenKm),
                          );
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: TileWithValue(
                    LocaleKeys.twentyKm.tr(),
                    PuppyIoColors.detailsDarkerGreen,
                    state.distance == Distance.twentyKm,
                    () {
                      context.read<HomeScreenMainBloc>().add(
                            const DogDistanceChanged(Distance.twentyKm),
                          );
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                    child: TileWithValue(
                      LocaleKeys.moreThan30km.tr(),
                      PuppyIoColors.oceanBlue,
                      state.distance == Distance.moreThanThirtyKm,
                      () {
                        context.read<HomeScreenMainBloc>().add(
                              const DogDistanceChanged(Distance.moreThanThirtyKm),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class GenderSection extends StatelessWidget {
  const GenderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenMainBloc, HomeScreenMainState>(builder: (context, state) {
      if (state is FilteringOfferDogsState) {
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
                      context.read<HomeScreenMainBloc>().add(
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
                        context.read<HomeScreenMainBloc>().add(
                              const DogSexChanged(Sex.female),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class SearchOfferButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      buttonDescription: LocaleKeys.search.tr(),
      onPressed: () {
        context.read<HomeScreenMainBloc>().add(
              SearchDog(),
            );
      },
    );
  }
}

class CleanResultsOfferButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PuppyIoOutlineButton(
      buttonDescription: LocaleKeys.cleanFilthers.tr(),
      onPressed: () {
        context.read<HomeScreenMainBloc>().add(
          CleanFilthers(),
        );
      },
    );
  }
}