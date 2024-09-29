
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_animals_app/models/animal_model.dart';

void main() {
	group('Animal Model Tests', () {
		test('Animal model should be correctly instantiated', () {
			const type = 'Cat';
			const icon = Icons.person;

			final animal = Animal(type: type, icon: icon);

			expect(animal.type, type);
			expect(animal.icon, icon);
		});

		test('Animal model should support equality', () {
			const type = 'Cat';
			const icon = Icons.person;

			final animal1 = Animal(type: type, icon: icon);
			final animal2 = Animal(type: type, icon: icon);

			expect(animal1, equals(animal2));
		});

		test('Animal model should have a proper hash code', () {
			const type = 'Cat';
			const icon = Icons.person;

			final animal = Animal(type: type, icon: icon);

			expect(animal.hashCode, isNotNull);
		});
	});
}
