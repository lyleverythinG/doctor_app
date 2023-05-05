import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/reusable_widgets/custom_elevated_button.dart';
import 'package:doctor_app/core/reusable_widgets/custom_text.dart';
import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
import 'package:doctor_app/features/user_home/presentation/widgets/provide_doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDoctorScreen extends StatefulWidget {
  const AddDoctorScreen({Key? key}) : super(key: key);

  @override
  State<AddDoctorScreen> createState() => _AddDoctorScreenState();
}

class _AddDoctorScreenState extends State<AddDoctorScreen> {
  final doctorNameC = TextEditingController();
  final yearsOfExpC = TextEditingController();
  String doctorTypeVal = Constants.cardiologistTxt;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DropdownMenuItem<String> doctorTypeOptions(String doctorType) {
    return DropdownMenuItem(
      value: doctorType,
      child: Text(
        doctorType,
      ),
    );
  }

  void clearFieldsAfterAdding() {
    doctorNameC.clear();
    doctorTypeVal = '';
    yearsOfExpC.clear();
  }

  @override
  void dispose() {
    doctorNameC.dispose();
    yearsOfExpC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                            value: doctorTypeVal,
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  CustomElevatedButton(
                    text: 'Add Doctor',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // hides keyboard
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<UserBloc>().add(CreateUserDoctor(
                            doctorName: doctorNameC.text.trim(),
                            doctorType: doctorTypeVal.trim(),
                            yearsOfExperience: yearsOfExpC.text.trim()));
                        Fluttertoast.showToast(
                          msg: 'Successfully Created The User',
                        );
                        //clearing fields after adding successfully.
                        clearFieldsAfterAdding();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
