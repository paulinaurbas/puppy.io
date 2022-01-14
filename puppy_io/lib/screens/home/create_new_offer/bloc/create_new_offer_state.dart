part of 'create_new_offer_bloc.dart';

class CreateNewOfferState {
  const CreateNewOfferState();
}

class CreatingNewOfferState extends CreateNewOfferState {
  const CreatingNewOfferState({
    required this.age,
    required this.breed,
    required this.sex,
    required this.localization,
    required this.description,
    required this.pictures,
  });

  final Age? age;
  final String? breed;
  final Sex? sex;
  final List<double>? localization;
  final String? description;
  final List<String>? pictures;

  CreatingNewOfferState copyWith(
      {Age? age,
      String? breed,
      Sex? sex,
      List<double>? localization,
      String? description,
      List<String>? pictures}) {
    return CreatingNewOfferState(
        age: age ?? this.age,
        breed: breed ?? this.breed,
        sex: sex ?? this.sex,
        localization: localization ?? this.localization,
        description: description ?? this.description,
        pictures: pictures ?? this.pictures);
  }
}

class LoadingScreenMainState extends CreateNewOfferState {
  const LoadingScreenMainState();
}
