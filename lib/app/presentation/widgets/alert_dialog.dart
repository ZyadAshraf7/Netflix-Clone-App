import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';

Future alertDialog({
  required BuildContext context,
  String? imagePath,
  required String title,
  String? subtitle,
  bool? hasButton,
  VoidCallback? buttonOnTap,
  String? buttonTitle,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Column(
        children: [
          imagePath == null
              ? const SizedBox()
              : SvgPicture.asset(
                  imagePath,
                  width: 100,
                  height: 45,
            color: AppTheme.redPrimaryColor,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle == null
              ? const SizedBox()
              : Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w600),
                ),
          const SizedBox(height: 15),

          hasButton == true
              ? CustomButton(
                  function: buttonOnTap,
                  child: Text(
                    buttonTitle!,
                    style: const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                )
              : const SizedBox()
        ],
      ),
    ),
  );
}
