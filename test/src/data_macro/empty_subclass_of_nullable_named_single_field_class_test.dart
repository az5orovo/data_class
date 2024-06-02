import 'package:data_class/data_class.dart';
import 'package:test/test.dart';

abstract class BaseClass {
  const BaseClass({this.field});
  final String? field;
}

@Data()
class EmptySubClass extends BaseClass {}

void main() {
  group(EmptySubClass, () {
    test('has a const constructor does not require param', () {
      const instance = EmptySubClass(field: 'field');
      expect(instance.field, equals('field'));
      expect(instance, isA<EmptySubClass>());
      expect(instance, isA<BaseClass>());
    });

    test('copyWith creates a copy when no arguments are passed', () {
      final instance = EmptySubClass(field: 'field');
      final copy = instance.copyWith();
      expect(copy.field, equals(instance.field));
    });

    test('copyWith creates a copy and overrides field', () {
      final instance = EmptySubClass(field: 'field');
      final copy = instance.copyWith(field: 'other');
      expect(copy.field, equals('other'));
    });

    test('copyWith creates a copy and overrides field with null', () {
      final instance = EmptySubClass(field: 'field');
      final copy = instance.copyWith(field: null);
      expect(copy.field, isNull);
    });

    test('== is correct', () {
      final instanceA = EmptySubClass(field: 'field');
      final instanceB = EmptySubClass(field: 'field');
      final instanceC = EmptySubClass(field: 'other');
      expect(instanceA, equals(instanceB));
      expect(instanceC, isNot(equals(instanceB)));
      expect(instanceC, isNot(equals(instanceA)));
    });

    test('hashCode is correct', () {
      final instanceA = EmptySubClass(field: 'field');
      final instanceB = EmptySubClass(field: 'field');
      final instanceC = EmptySubClass(field: 'other');
      expect(instanceA.hashCode, equals(instanceB.hashCode));
      expect(instanceC.hashCode, isNot(equals(instanceB.hashCode)));
      expect(instanceC.hashCode, isNot(equals(instanceA.hashCode)));
    });

    test('toString is correct', () {
      expect(
        EmptySubClass(field: 'field').toString(),
        equals('EmptySubClass(field: field)'),
      );
      expect(
        EmptySubClass().toString(),
        equals('EmptySubClass()'),
      );
      expect(
        EmptySubClass(field: null).toString(),
        equals('EmptySubClass()'),
      );
    });
  });
}
