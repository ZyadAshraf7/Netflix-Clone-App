import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String title;
  final bool isPasswordField;
  final bool isPasswordVisible;
  final bool ? hasBorder;
  TextEditingController? textEditingController;
  VoidCallback? changePasswordVisibility;

  CustomTextFormField({
    required this.hintText,
    required this.title,
    required this.isPasswordField,
    this.hasBorder=false,
    required this.textEditingController,
    this.isPasswordVisible = false,
    this.changePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: const TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: hasBorder!?Border.all(color: AppTheme.redPrimaryColor):const Border(),
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          height: 53,
          width: 310,
          child: TextFormField(
            cursorColor: AppTheme.midGreyColor,
            textAlignVertical: TextAlignVertical.center,
            controller: textEditingController,
            obscureText: isPasswordVisible,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: AppTheme.midGreyColor,
                fontSize: 15
              ),
              contentPadding: const EdgeInsets.only(left:20 ,top: 5),
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              //suffixIconColor: AppTheme.midGreyColor,
              suffixIcon: isPasswordField
                  ? IconButton(
                      onPressed: changePasswordVisibility,
                      icon: isPasswordVisible ? const Icon(Icons.visibility_off_rounded,color: AppTheme.midGreyColor,) : const Icon(Icons.remove_red_eye,color: AppTheme.midGreyColor,),
                    )
                  : const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
