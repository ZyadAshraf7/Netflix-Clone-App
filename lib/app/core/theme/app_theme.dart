import 'package:flutter/material.dart';

class AppTheme {
  static const Color redPrimaryColor = Color(0xffFF000D);
  static const Color greyColor = Color(0xff808080);
  static const Color midGreyColor = Color(0xff6D6D6E);
  static const Color smokeWhiteColor = Color(0xffE5E5E5);
  static const Color primaryBlackColor = Color(0xff141414);

  const AppTheme._();

  static final appThemeMode = ThemeData(
    scaffoldBackgroundColor: primaryBlackColor,
    fontFamily: 'SFProDisplay',
    platform: TargetPlatform.iOS,
    accentColor: midGreyColor
  );
}
