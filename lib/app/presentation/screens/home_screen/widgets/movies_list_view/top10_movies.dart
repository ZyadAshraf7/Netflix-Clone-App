import 'package:flutter/material.dart';

class Top10Movies extends StatelessWidget {
  const Top10Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 130,
      decoration: const BoxDecoration(
        color: Colors.white54,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(20,0),
            spreadRadius: 1,
            blurRadius: 10,
          )
        ]
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Image.asset("assets/images/poster.jpg"),
            height: 190,
            width: 130,
          ),
          Positioned(
            top: 40,
            child: Container(
              child: Image.asset("assets/images/child2.png"),
              height: 190,
              width: 50,
            ),
          ),
        ],
      )
    );
  }
}
