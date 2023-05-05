import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/reusable_widgets/custom_elevated_button.dart';
import 'package:doctor_app/core/reusable_widgets/custom_text.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
import 'package:doctor_app/features/user_home/presentation/widgets/provide_doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditDoctorInfoScreen extends StatefulWidget {
  final UserModel userModel;
  final int userIndex;
  final bool isWhiteAppBar;
  const EditDoctorInfoScreen({
    Key? key,
    required this.userModel,
    required this.userIndex,
    this.isWhiteAppBar = false,
  }) : super(key: key);

  @override
  State<EditDoctorInfoScreen> createState() => _EditDoctorInfoScreenState();
}

class _EditDoctorInfoScreenState extends State<EditDoctorInfoScreen> {
  final doctorNameC = TextEditingController();
  final yearsOfExpC = TextEditingController();
  String? doctorTypeVal = Constants.cardiologistTxt;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DropdownMenuItem<String> doctorTypeOptions(String doctorType) {
    return DropdownMenuItem(
      value: doctorType,
      child: Text(
        doctorType,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.userModel.id != null) {
      doctorNameC.text = widget.userModel.doctorName!;
      doctorTypeVal = widget.userModel.doctorType!;
      yearsOfExpC.text = widget.userModel.yearsOfExp!;
    }
  }

  @override
  void dispose() {
    doctorNameC.dispose();
    yearsOfExpC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: widget.isWhiteAppBar
            ? Constants.kWhite // use white app bar if coming from search bar.
            : null,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const CustomText(
                          text: 'Please Fill - Up Doctor Information:'),
                      Constants.gapH16,
                      const Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(text: 'Doctor Name:')),
                      ProvideDoctorInformation(
                        controller: doctorNameC,
                        textInputType: TextInputType.name,
                        hintText: 'Enter Doctor Full Name',
                        errorText: 'Please enter doctor name',
                      ),
                      Constants.gapH4,
                      const Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(text: 'Doctor Type:')),
                      // rebuild only this part of the widget.
                      StatefulBuilder(
                        builder: (context, builderSetState) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: DropdownButton<String>(
                                isExpanded: true,
                                value:
                                    doctorTypeVal ?? Constants.cardiologistTxt,
                                items: Constants.doctorTypeOptions
                                    .map(doctorTypeOptions)
                                    .toList(),
                                onChanged: (String? newOption) {
                                  builderSetState(() {
                                    doctorTypeVal = newOption!;
                                  });
                                }),
                          );
                        },
                      ),
                      Constants.gapH4,
                      const Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(text: 'Years of Experience:')),
                      ProvideDoctorInformation(
                        controller: yearsOfExpC,
                        textInputType: TextInputType.number,
                        hintText: 'Enter Years of Experience',
                        errorText: 'Please enter years of experience',
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      CustomElevatedButton(
                        text: 'Update Doctor Info',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<UserBloc>().add(
                                  UpdateDoctorInfo(
                                    isFavorite: widget.userModel.isFavorite!,
                                    userId: widget.userModel.id!,
                                    userIndex: widget.userIndex,
                                    doctorName: doctorNameC.text.trim(),
                                    doctorType: doctorTypeVal!.trim(),
                                    yearsOfExp: yearsOfExpC.text.trim(),
                                    createdAt: widget.userModel.createdAt!,
                                  ),
                                );
                            Fluttertoast.showToast(
                              msg: 'Successfully updated doctor information.',
                            );
                            // hides keyboard
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (widget.isWhiteAppBar) {
                              int count = 0;
                              // pop 3 times after updating doctor info if from search bar home screen.
                              Navigator.popUntil(
                                  context, (route) => count++ == 3);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
