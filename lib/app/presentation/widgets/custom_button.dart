import 'package:flutter/material.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? function;
  final Widget child;
  double ?width;
  double ?height;
  Color ? color;

  CustomButton({Key? key, required this.function, required this.child,this.width,this.height,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: width??310,
        height:height?? 53,
        decoration: BoxDecoration(
          color: color??AppTheme.redPrimaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: child
      ),
    );
  }
}
