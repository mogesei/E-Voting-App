// ignore_for_file: unnecessary_null_comparison
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_adress.freezed.dart';

class EmailAdress {
  final String value;
  final Either<Left, Right> failure;

  factory EmailAdress(String input) {
    assert(input != null);
    return EmailAdress._(
      ValidateEmailAdress(input),
    );
  }

  EmailAdress._(this.value, this.failure);

  @override
  String toString() => 'EmailAdress(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailAdress && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

String ValidateEmailAdress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return input;
  } else {
    throw InvalidEmailException(failedValue: input);
  }
}

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  factory ValueFailure.InvalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;
}
