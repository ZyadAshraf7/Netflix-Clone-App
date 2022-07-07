import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyMoviesList extends StatelessWidget {
  const EmptyMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*CircleAvatar(
            radius: 150,
            backgroundColor: Colors?.grey[700]?.withOpacity(0.5),
            backgroundImage:  AssetImage("assets/images/icons/empty-movies-list.png",),
          ),*/
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/empty.png",
                width: 120,
                height: 120,
                color: Colors.white.withOpacity(0.2),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 300,
            child: Center(
              child: Text(
                "Your List is Empty Make Sure You Fill it With Movies You Like...",
                style: TextStyle(
                  fontSize: 17,
                  wordSpacing: 1.3,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
