import 'package:flutter/material.dart';

class AddDoctorText extends StatelessWidget {
  const AddDoctorText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(
          'Please add a doctor',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
