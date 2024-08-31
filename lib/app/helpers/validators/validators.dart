extension EmailValidator on String {
  bool isValidEmail() {
    print(this);
    return RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$').hasMatch(this);
    // return RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
      //  .hasMatch(this);
  }
}

extension NameValidator on String {
  bool get isValidUserName => _validateUsername(this);

  bool _validateUsername(String value) {
    final regexUsername = RegExp(r'^[a-zA-Z0-9]+([_]?[a-zA-Z0-9]+)*$');
    return regexUsername.hasMatch(value);
  }
}

extension BirthDateValidator on DateTime {
  bool get isValidBirthDate => _validateBirthDate(this);

  bool _validateBirthDate(DateTime value) {
    return value.isBefore(DateTime.now());
  }
}

class NumberValidator {
  NumberValidator._();
  static final RegExp _saudiArabiaMobileRegex = RegExp(r'^(05|5)\d{8}$');

  static final RegExp _egyptMobileRegex = RegExp(r'^1[0-2,5]{1}[0-9]{8}$');

  static bool isValidMobileNumber(String number) {
    return _saudiArabiaMobileRegex.hasMatch(number);
  }

  static bool isValidEgyptMobileNumber(String number) {
    return _egyptMobileRegex.hasMatch(number);
  }

  static String getCountryCode(String number) {
    if (_saudiArabiaMobileRegex.hasMatch(number)) {
      return '966';
    } else {
      return '20';
    }
  }
}

extension CountryCodeUtil on String {
  String removeCountryCode() {
    final number = this.replaceAll('+', '');
    if (number.startsWith('966')) {
      return number.replaceFirst('966', '');
    } else {
      return number.replaceFirst('20', '');
    }
  }

   String addCountryCode() {
    if (NumberValidator.isValidMobileNumber(this)) {
      return '+966$this';
    } else if(NumberValidator.isValidEgyptMobileNumber(this)) {
      return '+20$this';
    }
    return this;
  }
}
