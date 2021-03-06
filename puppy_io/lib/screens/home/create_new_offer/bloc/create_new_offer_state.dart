part of 'create_new_offer_bloc.dart';

class CreateNewOfferState {
  const CreateNewOfferState();
}

class SuccessfulCreatedOfferState extends CreateNewOfferState {}

class ErrorCreatedOfferState extends CreateNewOfferState {}

class CreatingNewOfferState extends CreateNewOfferState {
  const CreatingNewOfferState({
    required this.name,
    required this.age,
    required this.breed,
    required this.sex,
    required this.localization,
    required this.description,
    required this.pictures,
    required this.offerID,
  });

  final String? name;
  final int? age;
  final String? breed;
  final Sex? sex;
  final List<double>? localization;
  final String? description;
  final List<String>? pictures;
  final int? offerID;

  CreatingNewOfferState copyWith(
      {String? name,
      int? age,
      String? breed,
      Sex? sex,
      List<double>? localization,
      String? description,
      List<String>? pictures,
      int? offerID}) {
    return CreatingNewOfferState(
        name: name ?? this.name,
        age: age ?? this.age,
        breed: breed ?? this.breed,
        sex: sex ?? this.sex,
        localization: localization ?? this.localization,
        description: description ?? this.description,
        pictures: pictures ?? this.pictures,
        offerID: offerID ?? this.offerID);
  }
}

class LoadingScreenMainState extends CreateNewOfferState {
  const LoadingScreenMainState();
}
