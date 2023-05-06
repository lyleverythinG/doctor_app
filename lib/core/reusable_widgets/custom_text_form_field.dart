import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? data;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool isObscure;
  final bool enabled;
  final String? initialValue;
  final String? Function(String?)? validator;
  final VoidCallback? iconOnpressed;
  final TextInputAction? textInputAction;

  // ignore: use_key_in_widget_constructors
  const CustomTextField({
    this.controller,
    this.initialValue,
    this.data,
    this.hintText,
    this.isObscure = true,
    this.enabled = true,
    this.keyboardType,
    required this.validator,
    this.textInputAction,
    this.onChanged,
    this.iconOnpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Constants.kWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        initialValue: initialValue,
        autocorrect: false,
        enableSuggestions: false,
        onChanged: onChanged,
        enabled: enabled,
        controller: controller,
        obscureText: isObscure,
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: Constants.kBlackBorderDecoration,
          prefixIcon: IconButton(
            icon: Icon(
              data,
              color: Constants.kBlack87,
            ),
            onPressed: iconOnpressed,
            disabledColor: Constants.kCyan,
            splashColor: Constants.kTransparent,
            color: Constants.kCyan,
          ),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
        ),
        validator: validator,
      ),
    );
  }
}
