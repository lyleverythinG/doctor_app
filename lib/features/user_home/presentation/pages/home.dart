import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/features/favorites/presentation/pages/favorites_screen.dart';
import 'package:doctor_app/features/sorted_doctors/presentation/pages/appbar_searched_screen.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
import 'package:doctor_app/features/user_home/presentation/pages/add_doctor_screen.dart';
import 'package:doctor_app/features/user_home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isHome = true;
  int _currentIndex = 0;
  List<UserModel> doctors = [];
  final List<Widget> screens = [
    const HomeScreen(),
    const AddDoctorScreen(),
    const FavoritesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    if (userState is UserUpdated) {
      doctors = userState.users;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (_currentIndex == 0)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(listOfDoctors: doctors));
              },
            ),
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Constants.kBlueAccent,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Constants.kBlack87,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Home", tooltip: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1),
            label: 'Add Doctor',
            tooltip: 'Add Doctor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
            tooltip: 'Favorites',
          ),
        ],
      ),
    );
  }
}
