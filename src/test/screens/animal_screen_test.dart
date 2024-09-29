
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_animals_app/screens/animal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_animals_app/cubits/animal_cubit.dart';
import 'package:simple_animals_app/models/animal_model.dart';

// Mock Cubit for testing
class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('AnimalScreen', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('displays Cat with person icon initially', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(Animal(type: 'Cat', icon: Icons.person));
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: animalCubit,
						child: AnimalScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
		
		testWidgets('displays Dog with access_time icon when toggled', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(Animal(type: 'Dog', icon: Icons.access_time));
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: animalCubit,
						child: AnimalScreen(),
					),
				),
			);

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});
		
		testWidgets('taps on screen and calls toggleAnimal()', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(Animal(type: 'Cat', icon: Icons.person));
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: animalCubit,
						child: AnimalScreen(),
					),
				),
			);

			await tester.tap(find.byType(GestureDetector));
			verify(() => animalCubit.toggleAnimal()).called(1);
		});
	});
}
