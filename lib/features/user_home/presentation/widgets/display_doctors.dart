import 'package:doctor_app/core/locator/service_locator.dart';
import 'package:doctor_app/core/navigation/navigation_animation.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
import 'package:doctor_app/features/user_home/presentation/pages/edit_doctor_info_screen.dart';
import 'package:doctor_app/features/user_home/presentation/widgets/add_doctor_text.dart';
import 'package:doctor_app/features/user_home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayDoctors extends StatelessWidget {
  const DisplayDoctors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return const AddDoctorText();
        }
        if (state is UserUpdated) {
          if (state.users.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.users.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      kNavigator.pushNavigateToWidget(SlideLeftRoute(
                          page: EditDoctorInfoScreen(
                        userIndex: index,
                        userModel: UserModel(
                            createdAt: state.users[index].createdAt,
                            doctorName: state.users[index].doctorName,
                            doctorType: state.users[index].doctorType,
                            id: state.users[index].id,
                            isFavorite: state.users[index].isFavorite,
                            updatedAt: state.users[index].updatedAt,
                            yearsOfExp: state.users[index].yearsOfExp),
                      )));
                    },
                    onDoubleTap: () {},
                    child: DoctorCard(
                        profileImg: 'assets/images/doctor1.jpg',
                        name: state.users[index].doctorName!,
                        doctorType: state.users[index].doctorType!,
                        addedSince: state.users[index].createdAt!,
                        yearsOfExp: state.users[index].yearsOfExp!),
                  );
                }),
              ),
            );
          } else {
            return const AddDoctorText();
          }
        }
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        // used this instead of an empty container because this is a const.
        return const SizedBox.shrink();
      },
    );
  }
}
