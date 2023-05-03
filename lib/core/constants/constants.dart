import 'package:flutter/material.dart';

class Constants {
  // text field decorations
  static const kTextFieldDecoration = InputDecoration(
    hintText: '',
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );
  static const kBlackBorderDecoration =
      OutlineInputBorder(borderSide: BorderSide(color: Constants.kBlack87));

  static BoxDecoration containerDecoration = BoxDecoration(
    color: Colors.lightBlueAccent,
    borderRadius: BorderRadius.circular(8),
  );

  // Colors
  static const Color kWhite = Colors.white;
  static const Color kBlack87 = Colors.black87;
  static const Color kBlue = Colors.blue;
  static const Color kBlueAccent = Colors.blueAccent;
// Theme Data
  static ThemeData aTheme = ThemeData(
    primaryColor: Constants.kBlue,
    secondaryHeaderColor: Constants.kBlueAccent,
    appBarTheme:
        const AppBarTheme().copyWith(backgroundColor: Constants.kBlueAccent),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
  );

  //Sizes
  static const p4 = 4.0;
  static const p8 = 8.0;
  static const p10 = 10.0;
  static const p12 = 12.0;
  static const p16 = 16.0;
  static const p20 = 20.0;
  static const p24 = 24.0;
  static const p32 = 32.0;
  static const p48 = 48.0;
  static const p64 = 64.0;

  //SizedBox widths
  static const gapW4 = SizedBox(width: Constants.p4);
  static const gapW12 = SizedBox(width: Constants.p12);
  static const gapW8 = SizedBox(width: Constants.p8);
  static const gapW10 = SizedBox(width: Constants.p10);
  static const gapW16 = SizedBox(width: Constants.p16);
  static const gapW20 = SizedBox(width: Constants.p20);
  static const gapW24 = SizedBox(width: Constants.p24);
  static const gapW32 = SizedBox(width: Constants.p32);
  static const gapW48 = SizedBox(width: Constants.p48);
  static const gapW64 = SizedBox(width: Constants.p64);

  //SizedBox heights
  static const gapH4 = SizedBox(height: Constants.p4);
  static const gapH12 = SizedBox(height: Constants.p12);
  static const gapH8 = SizedBox(height: Constants.p8);
  static const gapH10 = SizedBox(height: Constants.p10);
  static const gapH16 = SizedBox(height: Constants.p16);
  static const gapH20 = SizedBox(height: Constants.p20);
  static const gapH24 = SizedBox(height: Constants.p24);
  static const gapH32 = SizedBox(height: Constants.p32);
  static const gapH48 = SizedBox(height: Constants.p48);
  static const gapH64 = SizedBox(height: Constants.p64);
}
