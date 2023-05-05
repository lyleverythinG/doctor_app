import 'package:dio/dio.dart';
import 'package:doctor_app/core/network/api/user_api.dart';
import 'package:doctor_app/core/network/dio/dio_client.dart';
import 'package:doctor_app/features/user_home/data/repository/user_repo.dart';
import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
import 'package:doctor_app/features/user_home/presentation/pages/home.dart';
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

  group('Home - ', () {
    testWidgets('Bottom navigation bar exists', (WidgetTester tester) async {
      await tester.pumpWidget(BlocProvider(
        create: (context) => UserBloc(userRepo: userRepo),
        child: const MaterialApp(home: Home()),
      ));
      final bottomNavBar = find.byType(BottomNavigationBar);
      expect(bottomNavBar, findsOneWidget);
    });

    testWidgets('Search bar icon exist', (WidgetTester tester) async {
      await tester.pumpWidget(BlocProvider(
        create: (context) => UserBloc(userRepo: userRepo),
        child: const MaterialApp(home: Home()),
      ));
      final searchIcon = find.byType(IconButton);
      expect(searchIcon, findsOneWidget);
    });
  });
}
