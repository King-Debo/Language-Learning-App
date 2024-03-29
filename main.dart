import 'package:flutter_test/flutter_test.dart';

// A hypothetical function to test
int addNumbers(int a, int b) {
  return a + b;
}

void main() {
  group('addNumbers', () {
    test('should return the sum of two numbers', () {
      final result = addNumbers(2, 3);
      expect(result, 5);
    });

    test('should return a positive number when adding two negatives', () {
      final result = addNumbers(-1, -1);
      expect(result, -2);
    });
  });
}
