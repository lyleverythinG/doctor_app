import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';
import 'package:doctor_app/core/packages/sorted_doctors/sorted_doctors_feature_packages.dart';

class DoctorTypeOptions extends StatelessWidget {
  const DoctorTypeOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    List<UserModel> doctors = [];
    if (userState is UserUpdated) {
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
                    page: FilteredByDoctorTypeScreen(
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
