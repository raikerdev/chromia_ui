/// Base class for `ChromiaTextField` validators.
///
/// Extend this sealed class and implement [validate] to create custom
/// validation logic. The [error] message is returned when validation fails.
///
/// Built-in validators: [RequiredValidator], [EmailValidator],
/// [EqualsValidator], [DifferentValidator].
sealed class ChromiaTextFieldValidator {
  /// Creates a [ChromiaTextFieldValidator] with the given [error] message.
  ChromiaTextFieldValidator(this.error);

  /// The error message returned when validation fails.
  final String error;

  /// Validates [value] and returns the [error] message on failure, or `null`
  /// when the value is valid.
  String? validate(String? value);
}

/// Validates that the field is not empty.
class RequiredValidator extends ChromiaTextFieldValidator {
  /// Creates a [RequiredValidator] with the given [error] message.
  RequiredValidator(super.error);

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return error;
    }
    return null;
  }
}

/// Validates that the field value equals [compareValue].
class EqualsValidator extends ChromiaTextFieldValidator {
  /// Creates an [EqualsValidator] that fails unless the input matches
  /// [compareValue].
  EqualsValidator(super.error, {required this.compareValue});

  /// The value the input must equal to pass validation.
  final String compareValue;

  @override
  String? validate(String? value) {
    if (value != compareValue) {
      return error;
    }

    return null;
  }
}

/// Validates that the field value is different from [compareValue].
class DifferentValidator extends ChromiaTextFieldValidator {
  /// Creates a [DifferentValidator] that fails when the input matches
  /// [compareValue].
  DifferentValidator(super.error, {required this.compareValue});

  /// The value the input must differ from to pass validation.
  final String compareValue;

  @override
  String? validate(String? value) {
    if (value == compareValue) {
      return error;
    }

    return null;
  }
}

/// Validates that the field contains a well-formed email address.
class EmailValidator extends ChromiaTextFieldValidator {
  /// Creates an [EmailValidator] with the given [error] message.
  EmailValidator(super.error);

  @override
  String? validate(String? value) {
    final RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || !emailRegex.hasMatch(value)) {
      return error;
    }
    return null;
  }
}
