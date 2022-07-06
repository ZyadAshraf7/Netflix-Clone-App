import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileIconBox extends StatelessWidget {
  const ProfileIconBox({Key? key, required this.onTap, required this.iconPath, required this.title, this.iconHeight, this.iconWidth}) : super(key: key);
  final VoidCallback onTap;
  final String iconPath;
  final String title;
  final double?iconHeight;
  final double?iconWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: iconWidth??24,
            height: iconHeight??24,
            color: Colors.white.withOpacity(0.9),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 17,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
