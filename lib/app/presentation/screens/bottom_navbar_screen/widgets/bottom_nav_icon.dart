import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';

class BottomNavIcon extends StatelessWidget {
  final String iconPath;
  ///final String title;
  final bool isSelected;

  const BottomNavIcon({
    Key? key,
    required this.iconPath,
    //required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 24,
          width: 24,
          color: isSelected ? Colors.white : AppTheme.darkGrey,
        ),
       /* Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, color: isSelected ? Colors.white : AppTheme.darkGrey),
        ),*/
      ],
    );
  }
}
