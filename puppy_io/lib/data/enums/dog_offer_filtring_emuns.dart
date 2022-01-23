enum Age {
  oneTwoYears,
  threeSixYears,
  sixPlusYear,
}

int? getLowAge(Age? age) {
  switch (age) {
    case Age.oneTwoYears:
      return 1;
    case Age.threeSixYears:
      return 3;
    case Age.sixPlusYear:
      return 6;
    default:
      return null;
  }
}

int? getHighAge(Age? age) {
  switch (age) {
    case Age.oneTwoYears:
      return 2;
    case Age.threeSixYears:
      return 6;
    case Age.sixPlusYear:
      return 100;
    default:
      return null;
  }
}

enum Sex {
  male,
  female,
}

String? getSex(Sex? sex) {
  switch (sex) {
    case Sex.male:
      return "Male";
    case Sex.female:
      return "Female";
    default:
      return null;
  }
}

bool? getIsFemale(Sex? sex){
  switch (sex) {
    case Sex.male:
      return true;
    case Sex.female:
      return false;
    default:
      return null;
  }
}


Sex stringToSex(String sex) {
  switch (sex) {
    case "Male":
      return Sex.male;
    case "Female":
      return Sex.female;
    default:
      return Sex.female;
  }
}

enum Distance {
  tenKm,
  twentyKm,
  moreThanThirtyKm,
}

int? getDistance(Distance? distance) {
  switch (distance) {
    case Distance.tenKm:
      return 10;
    case Distance.twentyKm:
      return 20;
    case Distance.moreThanThirtyKm:
      return 30;
    default:
      return null;
  }
}
