import 'package:doctor_app/core/reusable_widgets/loading.dart';
import 'package:doctor_app/features/favorites/presentation/widgets/favorites_text.dart';
import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
import 'package:doctor_app/features/user_home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserUpdated) {
                  bool containsFavorites = state.users
                      .where((user) => user.isFavorite == 'true')
                      .isNotEmpty;
                  if (containsFavorites) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          if (state.users[index].isFavorite == 'true') {
                            return GestureDetector(
                              onDoubleTap: () {
                                context.read<UserBloc>().add(
                                    RemoveDoctorFromFavorites(
                                        user: state.users[index],
                                        userIndex: index));
                              },
                              child: DoctorCard(
                                isFavorite: state.users[index].isFavorite!,
                                addedSince: state.users[index].createdAt!,
                                doctorType: state.users[index].doctorType!,
                                name: state.users[index].doctorName!,
                                profileImg: 'assets/images/doctor1.jpg',
                                yearsOfExp: state.users[index].yearsOfExp!,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    );
                  }
                }
                if (state is LoadingState) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: const Loading());
                }
                return const NoFavoritesText();
              },
            ),
          ],
        ),
      ),
    );
  }
}
