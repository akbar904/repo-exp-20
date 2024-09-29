
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:your_package_name/cubits/animal_cubit.dart';

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is Animal(type: "Cat", icon: Icons.person)', () {
			expect(animalCubit.state, Animal(type: 'Cat', icon: Icons.person));
		});

		blocTest<AnimalCubit, Animal>(
			'emits [Animal(type: "Dog", icon: Icons.access_time)] when toggleAnimal is called and current state is Cat',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => <Animal>[Animal(type: 'Dog', icon: Icons.access_time)]
		);

		blocTest<AnimalCubit, Animal>(
			'emits [Animal(type: "Cat", icon: Icons.person)] when toggleAnimal is called and current state is Dog',
			build: () => animalCubit,
			act: (cubit) {
				cubit.toggleAnimal(); // Change to Dog first
				cubit.toggleAnimal(); // Change back to Cat
			},
			expect: () => <Animal>[
				Animal(type: 'Dog', icon: Icons.access_time),
				Animal(type: 'Cat', icon: Icons.person)
			]
		);
	});
}
