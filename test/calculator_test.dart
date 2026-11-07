import 'package:flutter_test/flutter_test.dart';
import 'package:personal_budget_planner/utils/calculator.dart';

void main() {
  group('Calculator Tests', () {
    final calculator = Calculator();

    test('Addition Test', () {
      expect(calculator.add(10, 20), 30);
    });

    test('Subtraction Test', () {
      expect(calculator.subtract(20, 10), 10);
    });

    test('Multiplication Test', () {
      expect(calculator.multiply(5, 4), 20);
    });
  });
}