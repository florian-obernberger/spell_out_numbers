import 'package:test/test.dart';
import 'package:spell_out_numbers/spell_out_numbers.dart';

void main() {
  test('tests the englisch translation without hyphens', () {
    final LanguageNumberScheme english = EnglishNumberScheme();
    expect(english.toWord(30), "thirty");
    expect(english.toWord(0), "zero");
    expect(
        english.toWord(-1398), "minus one thousand three hundred ninety eight");
    expect(english.toWord(74565416178),
        "seventy four billion five hundred sixty five million four hundred sixteen thousand one hundred seventy eight");
  });
  test('tests the englisch translation with hyphens', () {
    final LanguageNumberScheme english = EnglishNumberScheme(addHyphens: true);
    expect(english.toWord(30), "thirty");
    expect(english.toWord(0), "zero");
    expect(
        english.toWord(-1398), "minus one thousand three hundred ninety-eight");
    expect(english.toWord(74565416178),
        "seventy-four billion five hundred sixty-five million four hundred sixteen thousand one hundred seventy-eight");
  });
  test('tests the english translation with decimals', () {
    final LanguageNumberScheme english = EnglishNumberScheme();
    expect(english.toWord(10.0), "ten");
    expect(english.toWord(10.001), "ten and one thousandth");
  });
}
