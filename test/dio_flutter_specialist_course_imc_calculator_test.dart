import 'package:dio_flutter_specialist_course_imc_calculator/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Name Validation', () {
    test('Accepts valid single name', () {
      expect(isValidName('Lucas'), isTrue);
    });

    test('Rejects full name', () {
      expect(isValidName('Maria Clara'), isFalse);
    });

    test('Rejects name with numbers', () {
      expect(isValidName('Lucas123'), isFalse);
    });

    test('Rejects empty name', () {
      expect(isValidName(''), isFalse);
    });
  });

  group('Height Validation', () {
    test('Accepts valid height', () {
      expect(isValidHeight(170), isTrue);
    });

    test('Rejects too small height', () {
      expect(isValidHeight(20), isFalse);
    });

    test('Rejects too large height', () {
      expect(isValidHeight(400), isFalse);
    });
  });

  group('Weight Validation', () {
    test('Accepts valid weight', () {
      expect(isValidWeight(70.5), isTrue);
    });

    test('Rejects too small weight', () {
      expect(isValidWeight(0.5), isFalse);
    });

    test('Rejects too large weight', () {
      expect(isValidWeight(800), isFalse);
    });
  });
}
