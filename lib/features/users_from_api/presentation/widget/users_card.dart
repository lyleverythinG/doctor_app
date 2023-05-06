import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';

class UserApiCard extends StatelessWidget {
  final int usersCount;
  final String avatar;
  final String firstName;
  final String lastName;
  final String email;
  const UserApiCard(
      {Key? key,
      required this.usersCount,
      required this.avatar,
      required this.firstName,
      required this.lastName,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Constants.kBlueAccent,
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              Container(
                height: 80,
                width: 110,
                padding: const EdgeInsets.only(
                    left: 0, top: 10, bottom: 70, right: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(avatar), fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        CustomText(
                          text: firstName + ' ' + lastName,
                          fontSize: 18,
                        ),
                        Constants.gapW4,
                      ],
                    ),
                    Constants.gapH8,
                    CustomText(
                      text: email,
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
