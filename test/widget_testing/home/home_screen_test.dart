import 'package:dio/dio.dart';
import 'package:doctor_app/core/network/api/user_api.dart';
import 'package:doctor_app/core/network/dio/dio_client.dart';
import 'package:doctor_app/features/user_home/data/repository/user_repo.dart';
import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
import 'package:doctor_app/features/user_home/presentation/pages/home.dart';
import 'package:doctor_app/features/user_home/presentation/pages/home_page.dart';
import 'package:doctor_app/features/user_home/presentation/widgets/doctor_type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  UserRepo userRepo = UserRepo(
    userApi: API(
      dioClient: DioClient(
        dio: Dio(),
      ),
    ),
  );

  group('Home Screen - ', () {
    testWidgets('Displays Please add a doctor text',
        (WidgetTester tester) async {
      await tester.pumpWidget(BlocProvider(
        create: (context) => UserBloc(userRepo: userRepo),
        child: const MaterialApp(home: HomeScreen()),
      ));
      final plsAddDoctorTxt = find.text('Please add a doctor');
      expect(plsAddDoctorTxt, findsOneWidget);
    });

    testWidgets('Displays doctor type options widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(BlocProvider(
        create: (context) => UserBloc(userRepo: userRepo),
        child: const MaterialApp(home: Home()),
      ));
      final doctorTypeOptionWidget = find.byType(DoctorTypeOptions);
      expect(doctorTypeOptionWidget, findsOneWidget);
    });

    testWidgets('Displays the three doctor type options txt',
        (WidgetTester tester) async {
      await tester.pumpWidget(BlocProvider(
        create: (context) => UserBloc(userRepo: userRepo),
        child: const MaterialApp(home: Home()),
      ));
      final cardiologistTxt = find.text('Cardiologist');
      expect(cardiologistTxt, findsOneWidget);
      final neuroTxt = find.text('Neurologist');
      expect(neuroTxt, findsOneWidget);
      final pediaTxt = find.text('Pediatrician');
      expect(pediaTxt, findsOneWidget);
    });
  });
}
