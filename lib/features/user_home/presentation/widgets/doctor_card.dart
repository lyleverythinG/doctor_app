import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/reusable_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoctorCard extends StatelessWidget {
  final String profileImg;
  final String name;
  final String doctorType;
  final String addedSince;
  final String yearsOfExp;
  final String isFavorite;
  const DoctorCard({
    Key? key,
    required this.profileImg,
    required this.name,
    required this.doctorType,
    required this.addedSince,
    required this.yearsOfExp,
    required this.isFavorite,
  }) : super(key: key);

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
        children: [
          Row(
            children: <Widget>[
              Container(
                height: 150,
                width: 110,
                padding: const EdgeInsets.only(
                    left: 0, top: 10, bottom: 70, right: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(profileImg), fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              color: Constants.kBlack87,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                        Constants.gapW4,
                        if (isFavorite == 'true')
                          const Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                          )
                      ],
                    ),
                    Constants.gapH8,
                    CustomText(
                      text: doctorType,
                    ),
                    Constants.gapH8,
                    CustomText(
                        text: 'Added:' +
                            DateFormat.yMMMMd()
                                .format(DateTime.parse(addedSince))),
                    Constants.gapH8,
                    Row(
                      children: [
                        const CustomText(
                          text: 'Years of Experience: ',
                        ),
                        CustomText(
                          text: yearsOfExp,
                        ),
                      ],
                    ),
                    Constants.gapH8,
                    if (isFavorite == 'false')
                      const CustomText(
                        text: 'Double tap to add to favorites',
                        color: Colors.yellowAccent,
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
