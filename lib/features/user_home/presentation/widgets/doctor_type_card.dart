import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/locator/service_locator.dart';
import 'package:doctor_app/core/navigation/navigation_animation.dart';
import 'package:doctor_app/core/reusable_widgets/custom_text.dart';
import 'package:doctor_app/features/sorted_doctors/presentation/bloc/bloc/sorted_bloc.dart';
import 'package:doctor_app/features/sorted_doctors/presentation/pages/sorted_doctors_screen.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
import 'package:doctor_app/features/user_home/presentation/widgets/doctor_type_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorTypeOptions extends StatelessWidget {
  const DoctorTypeOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    List<UserModel> doctors = [];
    if (userState is UserUpdated) {
      debugPrint('userupdated ni ! ${userState.users.length}');
      doctors = userState.users;
    }
    List<DoctorTypeIcon> doctorTypeIcon = [
      DoctorTypeIcon(
          doctorType: "Cardiologist", icon: 'assets/images/cardio_option.png'),
      DoctorTypeIcon(
          doctorType: "Neurologist", icon: 'assets/images/neuro_option.png'),
      DoctorTypeIcon(
          doctorType: "Pediatrician", icon: 'assets/images/pedia_option.png'),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(doctorTypeIcon.length, (index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                context.read<SortedBloc>().add(SortByDoctorType(
                    doctorType: doctorTypeIcon[index].doctorType,
                    doctors: doctors));
                kNavigator.pushNavigateToWidget(SlideLeftRoute(
                    page: SortedDoctorScreen(
                  doctorType: doctorTypeIcon[index].doctorType,
                )));
              },
              child: DoctorTypeImage(
                doctorTypeIcon: doctorTypeIcon[index].icon,
              ),
            ),
            Constants.gapH4,
            CustomText(
              text: doctorTypeIcon[index].doctorType,
            )
          ],
        );
      }),
    );
  }
}

class DoctorTypeIcon {
  final String doctorType;
  final String icon;
  DoctorTypeIcon({
    required this.doctorType,
    required this.icon,
  });
}
