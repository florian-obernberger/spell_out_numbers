<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Spell Out Numbers

[![License](https://img.shields.io/github/license/florian-obernberger/spell_out_numbers)](./LICENSE)
[![Dart](https://github.com/florian-obernberger/spell_out_numbers/actions/workflows/dart.yml/badge.svg)](https://github.com/florian-obernberger/spell_out_numbers/actions/workflows/dart.yml)

## Features

Writes put the name of a number given in different languages.
Currently only English is supported, but in the future I will
add more languages. If anyone is interested in helping me with
that, feel free to contact me / open an issue.

## Language Support

- [x] English
- [ ] German / Deutsch
- [ ] Spanish / Español

## Usage

There is one abstract class (`LanguageNumberScheme`) that all
other classes inherit from. This class and all classes extending
this one provide amongst others the following methods and getters:

- `toWord(num number)`: converts the number given into words
- `num get maxNumber;`: the largest number supported by the scheme
- `int get maxDecimals;`: the maximum number of decimal values

## Examples

```dart
LanguageNumberScheme scheme = EnglishNumberScheme();

print(scheme.toWord(10));
// ten
```

```dart
LanguageNumberScheme scheme = EnglishNumberScheme();

print(scheme.toWord(-1398));
// minus one thousand three hundred ninety eight
```
