import 'package:doctor_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileCircleAvatar extends StatelessWidget {
  const ProfileCircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.20,
        backgroundColor: Constants.kWhite,
        backgroundImage: const AssetImage('assets/images/doctor1.jpg'),
      ),
    );
  }
}
