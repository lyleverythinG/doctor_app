import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';

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
                  // Swipe left or right to delete a user from the list.
                  return Dismissible(
                    key: Key(state.users[index].id!),
                    background: Container(
                      color: Constants.kRedAccent,
                      child: const Center(
                        child: Icon(Icons.delete),
                      ),
                    ),
                    onDismissed: (direction) async {
                      context.read<UserBloc>().add(DeleteDoctor(
                          index: index, userId: state.users[index].id!));
                    },
                    child: GestureDetector(
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
                      onDoubleTap: () {
                        // Can add or remove from favorites.
                        state.users[index].isFavorite == 'false'
                            ? context.read<UserBloc>().add(
                                  AddDoctorToFavorites(
                                      user: state.users[index],
                                      userIndex: index),
                                )
                            : context.read<UserBloc>().add(
                                RemoveDoctorFromFavorites(
                                    user: state.users[index],
                                    userIndex: index));
                      },
                      child: DoctorCard(
                          isFavorite: state.users[index].isFavorite!,
                          profileImg: 'assets/images/doctor1.jpg',
                          name: state.users[index].doctorName!,
                          doctorType: state.users[index].doctorType!,
                          addedSince: state.users[index].createdAt!,
                          yearsOfExp: state.users[index].yearsOfExp!),
                    ),
                  );
                }),
              ),
            );
          } else {
            return const AddDoctorText();
          }
        }
        if (state is LoadingState) {
          return const Loading();
        }
        // Used SizedBox.shrink instead of an empty container because this is a const.
        return const SizedBox.shrink();
      },
    );
  }
}
