enum Age {
  oneTwoYears,
  threeSixYears,
  sixPlusYear,
}

enum Sex {
  male,
  female,
}

String getSex(Sex sex) {
  switch (sex) {
    case Sex.male:
      return "Male";
    case Sex.female:
      return "Female";
    default:
      return "Unknown";
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
