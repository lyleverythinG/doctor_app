import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/reusable_widgets/custom_text.dart';
import 'package:doctor_app/core/reusable_widgets/loading.dart';
import 'package:doctor_app/features/sorted_doctors/presentation/bloc/bloc/sorted_bloc.dart';
import 'package:doctor_app/features/user_home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortedDoctorScreen extends StatelessWidget {
  final String doctorType;
  const SortedDoctorScreen({Key? key, required this.doctorType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: doctorType.toUpperCase(), color: Constants.kBlack87),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16).copyWith(top: 0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            BlocBuilder<SortedBloc, SortedState>(
              builder: (context, state) {
                if (state is SortedDoctorsResult) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.sortedDoctors.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: DoctorCard(
                            isFavorite: state.sortedDoctors[index].isFavorite!,
                            profileImg: 'assets/images/doctor1.jpg',
                            name: state.sortedDoctors[index].doctorName!,
                            doctorType: state.sortedDoctors[index].doctorType!,
                            addedSince: state.sortedDoctors[index].createdAt!,
                            yearsOfExp: state.sortedDoctors[index].yearsOfExp!,
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is EmptySortedResult) {
                  return Expanded(
                    child: Center(
                      child: CustomText(
                        text: 'No  $doctorType added at the moment',
                      ),
                    ),
                  );
                }
                if (state is SortedUsersLoadingState) {
                  return const Loading();
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
