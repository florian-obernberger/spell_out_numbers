library spell_out_numbers;

export 'languages/english.dart';

import 'package:tuple/tuple.dart';

class TooLargeNumberException implements Exception {
  final num errorNumber;
  final num maxNumber;
  TooLargeNumberException(this.errorNumber, this.maxNumber);

  @override
  String toString() {
    return "The number $errorNumber is too large. The maximum supported is $maxNumber.";
  }
}

class TooManyDecimalValues implements Exception {
  final num errorNumber;
  final int maxDecimals;
  final int errorDecimals;
  TooManyDecimalValues(this.errorNumber, this.errorDecimals, this.maxDecimals);

  @override
  String toString() {
    return "The number $errorNumber has too many decimal values ($errorDecimals). The maximum supported is $maxDecimals.";
  }
}

abstract class LanguageNumberScheme {
  /// The largest number supported by the scheme.
  num get maxNumber;

  /// The maximum amount of decimal values supported by the scheme.
  int get maxDecimals;

  const LanguageNumberScheme();

  /// Checks if the given number has a comma. (3.04 -> true, 3 -> false)
  bool hasComma(num number) {
    return number.toString().contains(".");
  }

  /// Splits a given number by it's comma, if it has one.
  /// Returns both parts of the number if a comma is present, otherwise returns
  /// the original number and null.
  Tuple2<num, num?> splitByComma(num number) {
    if (!hasComma(number)) {
      return Tuple2(number, null);
    }
    List<String> numParts = number.toString().split(".");
    assert(numParts.length == 2);
    return Tuple2(num.parse(numParts.first), num.tryParse(numParts.last));
  }

  /// Removes all trailing zeros after a comma.
  num removeDecimalZeros(num number) {
    if (!hasComma(number)) {
      return number;
    }
    return num.parse(
      number.toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), ""),
    );
  }

  /// Converts a given number to a spelled out version of itself.
  String toWord(num number);
}
