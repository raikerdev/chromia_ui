sealed class ChromiaTextFieldValidator {
  final String error;

  ChromiaTextFieldValidator(this.error);

  String? validate(String? value);
}

class RequiredValidator extends ChromiaTextFieldValidator {
  RequiredValidator(super.error);

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return error;
    }
    return null;
  }
}

class EqualsValidator extends ChromiaTextFieldValidator {
  final String compareValue;

  EqualsValidator(super.error, {required this.compareValue});

  @override
  String? validate(String? value) {
    if (value != compareValue) {
      return error;
    }

    return null;
  }
}

class EmailValidator extends ChromiaTextFieldValidator {
  EmailValidator(super.error);

  @override
  String? validate(String? value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || !emailRegex.hasMatch(value)) {
      return error;
    }
    return null;
  }
}
