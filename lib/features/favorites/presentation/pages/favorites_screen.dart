import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';
import '../../../../core/packages/favorites_packages/favorites_related_packages.dart';

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
                    // Displays listview cards if it contains favorites.
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
                  // Displays the loading widget when fetching users.
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
