import 'dart:developer';

class FieldValidators {
  FieldValidators._();

  static final FieldValidators _instance = FieldValidators._();

  factory FieldValidators() => _instance;

  String? required(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      log("returning error", name: "required validator");
      return " $fieldName is required";
    }
    log("returning normally", name: "required validator");
    return null;
  }

  String? fullName(String? val) {
    RegExp namePattern = RegExp(r"^[a-zA-Z]+$"); // Allows only alphabets

    if (val == null || val.isEmpty) {
      log("returning error", name: "name validator");
      return "Name is required.";
    }

    if (!namePattern.hasMatch(val)) {
      log("returning error", name: "name validator");
      return "Enter a valid name (only alphabets allowed).";
    }

    log("returning normally", name: "name validator");
    return null;
  }

  String? email(String? val) {
    RegExp emailPattern =
        RegExp(r"""^[a-z0-9!@#\$%^&*_(),.?\":{}|<>]+@gmail\.com$""");

    if (!emailPattern.hasMatch(val ?? "")) {
      log("returning error", name: "email validator");
      return "Enter valid Email.";
    }

    log("returning normally", name: "email validator");
    return null;
  }

  String? password(String? val) {
    if (val == null || val.isEmpty) {
      return null;
    }

    RegExp passwordPattern = RegExp(
      r"""^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?":{}|<>])(?=.*[a-zA-Z0-9!@#\$%^&*(),.?":{}|<>]).{8,}$""",
    );

    if (!passwordPattern.hasMatch(val)) {
      log("returning error - $val", name: "password validator");
      return "Password must be at least 8 characters long and include an uppercase letter, a number, and a special character.";
    }
    log("returning normally", name: "password validator");
    return null;
  }

  String? phoneNumber(String phoneNumber, int length) {
    if (phoneNumber.isEmpty) {
      return "Mobile number is required";
    }

    RegExp phonePattern = RegExp(r"^\d{length}$");
//!phonePattern.hasMatch(val)
//     myLog(msg: phoneNumber);
//     myLog(msg: phoneNumber.length.toString());
//     myLog(msg: length.toString());
    if (phoneNumber.length != length) {
      log("returning error - $phoneNumber", name: "phone number validator");
      return "Phone number must be $length digits.";
    }
    log("returning normally", name: "phone number validator");
    return null;
  }

  String? maxLength(String? val, int max) {
    if (val == null || val.isEmpty) {
      return null;
    }

    if (val.length > max) {
      log("returning error", name: "maxLength validator");
      return "Field must not exceed $max characters.";
    }
    log("returning normally", name: "maxLength validator");
    return null;
  }

  String? minLength(String? val, int min) {
    if (val == null || val.isEmpty) {
      return null;
    }

    if (val.length < min) {
      log("returning error", name: "minLength validator");
      return "Field must be at least $min characters.";
    }
    log("returning normally", name: "minLength validator");
    return null;
  }

  String? pattern(String? val, String pattern, String errorMessage) {
    if (val == null || val.isEmpty) {
      return null;
    }

    if (!RegExp(pattern).hasMatch(val)) {
      log("returning error", name: "pattern validator");
      return errorMessage;
    }

    log("returning normally", name: "pattern validator");
    return null;
  }

  String? rangeValidator(num? val, num min, num max) {
    if (val == null) return null;

    if (val < min || val > max) {
      log("returning error", name: "rangeValidator validator");
      return "Value must be between $min and $max.";
    }

    log("returning normally", name: "rangeValidator validator");
    return null;
  }

  String? dateValidator(DateTime? date, {DateTime? min, DateTime? max}) {
    if (date == null) return null;

    if (min != null && date.isBefore(min)) {
      return "Date must be after ${min.toIso8601String()}";
    }
    if (max != null && date.isAfter(max)) {
      return "Date must be before ${max.toIso8601String()}";
    }
    return null;
  }

  String? lengthValidator(String? val, int length) {
    if (val == null || val.isEmpty) {
      return null;
    }

    if (val.length != length) {
      log("returning error", name: "lengthValidator validator");
      return "Field must be exactly $length characters.";
    }

    log("returning normally", name: "lengthValidator validator");
    return null;
  }

  String? multiCheck(String? value, List<String? Function(String?)> validators) {
    for (var validator in validators) {
      final result = validator(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
