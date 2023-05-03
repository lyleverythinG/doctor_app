import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class DoctorTypeOptions extends StatelessWidget {
  const DoctorTypeOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DoctorTypeIcon> doctorTypeIcon = [
      DoctorTypeIcon(
          name: "Cardiologists", icon: 'assets/images/cardio_option.png'),
      DoctorTypeIcon(
          name: "Neurologists", icon: 'assets/images/neuro_option.png'),
      DoctorTypeIcon(
          name: "Pediatricians", icon: 'assets/images/pedia_option.png'),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(doctorTypeIcon.length, (index) {
        return Column(
          children: [
            Container(
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                doctorTypeIcon[index].icon,
              ),
            ),
            Constants.gapH4,
            CustomText(
              text: doctorTypeIcon[index].name,
            )
          ],
        );
      }),
    );
  }
}

class DoctorTypeIcon {
  final String name;
  final String icon;
  DoctorTypeIcon({
    required this.name,
    required this.icon,
  });
}
