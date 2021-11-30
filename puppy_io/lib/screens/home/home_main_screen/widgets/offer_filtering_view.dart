import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/helpers/colors/puppy_io_colors.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/tile_with_value.dart';
import 'package:puppy_io/widgets/primary_button.dart';

class OfferFilering extends StatelessWidget {
  OfferFilering({Key? key}) : super(key: key);

  List<String> breadsList = ['Hovawart', 'Hask', 'Owczarek niemiecki'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    BreedDropDown(
                      breadsList,
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
          SearchOfferButton(),
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
    return DropdownButton<String>(
      items: breadsList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}

class AgeFiled extends StatelessWidget {
  const AgeFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.sex.tr(),
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
              child: TileWithValue(LocaleKeys.oneYear.tr(), PuppyIoColors.detailsLightGreen, false),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: TileWithValue(LocaleKeys.treeYears.tr(), PuppyIoColors.detailsLightGreen, false),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: TileWithValue(LocaleKeys.sixYears.tr(), PuppyIoColors.detailsLightGreen, false),
            )
          ],
        )
      ],
    );
  }
}

class OfferDistance extends StatelessWidget {
  const OfferDistance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: TileWithValue(LocaleKeys.tenKm.tr(), PuppyIoColors.detailsLightGreen, false),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: TileWithValue(LocaleKeys.twentyKm.tr(), PuppyIoColors.detailsLightGreen, false),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: TileWithValue(LocaleKeys.moreThan30km.tr(), PuppyIoColors.detailsLightGreen, false),
            )
          ],
        )
      ],
    );
  }
}

class GenderSection extends StatelessWidget {
  const GenderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: TileWithValue(LocaleKeys.oneYear.tr(), PuppyIoColors.detailsLightGreen, false),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: TileWithValue(LocaleKeys.oneYear.tr(), PuppyIoColors.detailsLightGreen, false),
            ),
          ],
        )
      ],
    );
  }
}

class SearchOfferButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
          buttonDescription: LocaleKeys.search.tr(),
          onPressed: () {}
        );
  }
}