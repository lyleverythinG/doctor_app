import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
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
        // used this instead of an empty container because this is a const.
        return const SizedBox.shrink();
      },
    );
  }
}
