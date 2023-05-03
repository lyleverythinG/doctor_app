import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/features/favorites/presentation/pages/favorites_screen.dart';
import 'package:doctor_app/features/home/presentation/widgets/doctor_type_card.dart';
import 'package:doctor_app/features/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHome = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isHome
          ? Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Doctor Type",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Constants.gapH12,
                  const DoctorTypeOptions(),
                  Constants.gapH24,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Doctors:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Constants.gapH10,
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onDoubleTap: () {},
                          child: DoctorCard(
                              profileImg: 'assets/images/doctor1.jpg',
                              name: 'James Hope',
                              doctorType: 'Cardiologists',
                              addedSince: DateTime.now(),
                              yearsOfExp: '10'),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          : const FavoritesScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          setState(() {
            isHome = !isHome;
          });
        },
        backgroundColor: Constants.kBlueAccent,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Constants.kBlack87,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Home",
          ),
        ],
      ),
    );
  }
}
