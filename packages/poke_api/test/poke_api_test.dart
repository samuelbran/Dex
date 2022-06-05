import 'package:flutter_test/flutter_test.dart';

import 'package:poke_api/poke_api.dart';

void main() {
  test('adds one to input values', () {
    final calculator = PokeApi();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
