import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/features/user_home/presentation/widgets/display_doctors.dart';
import 'package:doctor_app/features/user_home/presentation/widgets/doctor_type_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Constants.gapH10,
          const DisplayDoctors(),
        ],
      ),
    );
  }
}
