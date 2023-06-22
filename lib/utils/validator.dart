// ignore_for_file: prefer_const_declarations

String? emailValueData(String? value) {
  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
  );

  if (emailRegex.hasMatch(value.toString())) {
    return null;
  } else {
    return 'Email incorrect';
  }
}

String? passwordValueData(String? value) {
  final passwordPattern = r"^[A-Za-z\d]{6,}";
  final passwordRegExp = RegExp(passwordPattern);
  if (passwordRegExp.hasMatch(
    value.toString(),
  )) {
    return null;
  } else {
    return 'Password is incorrect';
  }
}

String? nameValueData(String? value) {
  final namePattern = r"^[a-zA-Zа-яА-Я]+(?:\s[a-zA-Zа-яА-Я]+)*$";
  final nameRegExp = RegExp(namePattern);
  if (nameRegExp.hasMatch(
    value.toString(),
  )) {
    return null;
  } else {
    return 'Name is incorrect';
  }
}

String? usernameValueData(String? value) {
  final usernamePattern = r"^[a-zA-Z0-9_]{3,20}$";
  final usernameRegExp = RegExp(usernamePattern);
  if (usernameRegExp.hasMatch(
    value.toString(),
  )) {
    return null;
  } else {
    return 'Username is incorrect';
  }
}
