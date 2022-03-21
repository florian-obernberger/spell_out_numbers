// import 'dart:math';
import 'package:tuple/tuple.dart';

import '../spell_out_numbers.dart';
import 'package:intl/intl.dart';

class EnglishNumberScheme extends LanguageNumberScheme {
  @override
  final num maxNumber = 9223372036854775807;

  @override
  final int maxDecimals = 35;

  final NumberFormat format = NumberFormat.decimalPattern("en_US");

  /// Decides if there will be hyphens ("-") between numbers like "eighty-one"
  /// or "seventy-three".
  final bool addHyphens;
  EnglishNumberScheme({this.addHyphens = false}) : super();

  @override
  String toWord(num number) {
    if (number == 0) return "zero";

    if (number > maxNumber) {
      throw TooLargeNumberException(number, maxNumber);
    }

    if (hasComma(number)) {
      print("yes");
      Tuple2<num, num?> numParts = splitByComma(removeDecimalZeros(number));
      print(numParts);
      String partOne = toWord(numParts.item1);
      String partTwo = toWord(numParts.item2!);
      late String endPart;

      switch (partTwo.toString().length) {
        case 1:
          endPart = " tenth";
          break;
        case 2:
          endPart = " hundredth";
          break;
        case 3:
          endPart = " thousandth";
          break;
        case 4:
          endPart = addHyphens ? " ten-thousandth" : " ten thousandth";
          break;
        case 5:
          endPart = addHyphens ? " hundred-thousandth" : " hundred thousandth";
          break;
        case 6:
          endPart = " millionth";
          break;
        case 7:
          endPart = addHyphens ? " ten-millionth" : " ten millionth";
          break;
        case 8:
          endPart = addHyphens ? " hundred-millionths" : " hundred millionths";
          break;
        case 9:
          endPart = " billionth";
          break;
        case 10:
          endPart = addHyphens ? " ten-billionths" : " ten billionths";
          break;
        case 11:
          endPart = addHyphens ? " hundred-billionth" : " hundred billionth";
          break;
        case 12:
          endPart = " trillionth";
          break;
        case 13:
          endPart = addHyphens ? " ten-trillionth" : " ten trillionth";
          break;
        case 14:
          endPart = addHyphens ? " hundred-trillionth" : " hundred trillionth";
          break;
        case 15:
          endPart = " quadrillionth";
          break;
        case 16:
          endPart = addHyphens ? " ten-quadrillionth" : " ten quadrillionth";
          break;
        case 17:
          endPart =
              addHyphens ? " hundred-quadrillionth" : " hundred quadrillionth";
          break;
        case 18:
          endPart = " quintillionth";
          break;
        case 19:
          endPart = addHyphens ? " ten-quintillionth" : " ten quintillionth";
          break;
        case 20:
          endPart =
              addHyphens ? " hundred-quintillionth" : " hundred quintillionth";
          break;
        case 21:
          endPart = " sextillionth";
          break;
        case 22:
          endPart = addHyphens ? " ten-sextillionth" : " ten sextillionth";
          break;
        case 23:
          endPart =
              addHyphens ? " hundred-sextillionth" : " hundred sextillionth";
          break;
        case 24:
          endPart = " septillionth";
          break;
        case 25:
          endPart = addHyphens ? " ten-septillionth" : " ten septillionth";
          break;
        case 26:
          endPart =
              addHyphens ? " hundred-septillionth" : " hundred septillionth";
          break;
        case 27:
          endPart = " octillionth";
          break;
        case 28:
          endPart = addHyphens ? " ten-octillionth" : " ten octillionth";
          break;
        case 29:
          endPart =
              addHyphens ? " hundred-octillionth" : " hundred octillionth";
          break;
        case 30:
          endPart = " nonillionth";
          break;
        case 31:
          endPart = addHyphens ? " ten-nonillionth" : " ten nonillionth";
          break;
        case 32:
          endPart =
              addHyphens ? " hundred-nonillionth" : " hundred nonillionth";
          break;
        case 33:
          endPart = " decillionth";
          break;
        case 34:
          endPart = addHyphens ? " ten-decillionth" : " ten decillionth";
          break;
        case 35:
          endPart =
              addHyphens ? " hundred-decillionth" : " hundred decillionth";
          break;
        default:
          throw TooManyDecimalValues(
            number,
            partTwo.toString().length,
            maxDecimals,
          );
      }

      return partTwo == "one"
          ? partOne + " and " + partTwo + endPart
          : partOne + " and " + partTwo + endPart + "s";
    }

    num _number = number.abs();
    List<String> words = [];
    List<num> groups =
        format.format(_number).split(",").map((e) => num.parse(e)).toList();

    List<num> groups_ = groups.reversed.toList();

    for (int i = 0; i < groups_.length; i++) {
      words.add(i == 0 ? _thousand(groups_[i]) : _more(groups_[i], i));
    }

    String word = words.reversed.join(" ");
    return number < 0 ? "minus " + word : word;
  }

  String _more(num _number, [int order = 0]) {
    late String name;

    switch (order) {
      case 1:
        name = " thousand";
        break;
      case 2:
        name = " million";
        break;
      case 3:
        name = " billion";
        break;
      case 4:
        name = " trillion";
        break;
      case 5:
        name = " quadrillion";
        break;
      case 6:
        name = " quintillion";
        break;
      case 7:
        name = " sextillion";
        break;
      case 8:
        name = " septillion";
        break;
      case 9:
        name = " octillion";
        break;
      case 10:
        name = " nonillion";
        break;
      case 11:
        name = " decillion";
        break;
      case 12:
        name = " decillion";
        break;
      case 13:
        name = " duodecillion";
        break;
      case 14:
        name = " tredecillion";
        break;
      case 15:
        name = " quattuordecillion";
        break;
      case 16:
        name = " quindecillion";
        break;
      case 17:
        name = " sexdecillion";
        break;
      case 18:
        name = " septendecillion";
        break;
      case 19:
        name = " octodecillion";
        break;
      case 20:
        name = " novemdecillion";
        break;
      case 21:
        name = " vigintillion";
        break;
      default:
        throw TooLargeNumberException(_number, maxNumber);
    }

    return _thousand(_number) + name;
  }

  String _thousand(num _number) {
    if (_number < 100) {
      return _hundred(_number);
    } else if (_number > 999) {
      return "";
    }
    num twoPart = _number % 100;
    num frontPart = (_number / 100).floor();
    return twoPart == 0
        ? _twenty(frontPart) + " hundred"
        : _twenty(frontPart) + " hundred " + _hundred(twoPart);
  }

  String _hundred(num _number) {
    String spacer = addHyphens ? "-" : " ";
    if (_number < 20) {
      return _twenty(_number);
    } else if (20 <= _number && _number < 30) {
      num onePart = _number % 20;
      return onePart == 0 ? "twenty" : "twenty$spacer" + _twenty(onePart);
    } else if (30 <= _number && _number < 40) {
      num onePart = _number % 30;
      return onePart == 0 ? "thirty" : "thirty$spacer" + _twenty(onePart);
    } else if (40 <= _number && _number < 50) {
      num onePart = _number % 40;
      return onePart == 0 ? "forty" : "forty$spacer" + _twenty(onePart);
    } else if (50 <= _number && _number < 60) {
      num onePart = _number % 50;
      return onePart == 0 ? "fifty" : "fifty$spacer" + _twenty(onePart);
    } else if (60 <= _number && _number < 70) {
      num onePart = _number % 60;
      return onePart == 0 ? "sixty" : "sixty$spacer" + _twenty(onePart);
    } else if (70 <= _number && _number < 80) {
      num onePart = _number % 70;
      return onePart == 0 ? "seventy" : "seventy$spacer" + _twenty(onePart);
    } else if (80 <= _number && _number < 90) {
      num onePart = _number % 80;
      return onePart == 0 ? "eighty" : "eighty$spacer" + _twenty(onePart);
    } else if (90 <= _number && _number < 100) {
      num onePart = _number % 90;
      return onePart == 0 ? "ninety" : "ninety$spacer" + _twenty(onePart);
    } else {
      return "";
    }
  }

  String _twenty(num _number) {
    switch (_number) {
      case 0:
        return "";
      case 1:
        return "one";
      case 2:
        return "two";
      case 3:
        return "three";
      case 4:
        return "four";
      case 5:
        return "five";
      case 6:
        return "six";
      case 7:
        return "seven";
      case 8:
        return "eight";
      case 9:
        return "nine";
      case 10:
        return "ten";
      case 11:
        return "eleven";
      case 12:
        return "twelve";
      case 13:
        return "thirteen";
      case 14:
        return "fourteen";
      case 15:
        return "fifteen";
      case 16:
        return "sixteen";
      case 17:
        return "seventeen";
      case 18:
        return "eighteen";
      case 19:
        return "nineteen";
      default:
        return "";
    }
  }
}
