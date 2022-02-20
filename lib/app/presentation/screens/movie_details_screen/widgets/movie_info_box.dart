import 'package:flutter/material.dart';
Widget movieInfoBox(){
  return SizedBox(
    width: 250,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "94% Match",
            style: TextStyle(
                color: Color(
                  0xff27AE60,
                ),
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          const Text(
            "2019",
            style: TextStyle(color: Colors.white38, fontSize: 14),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.grey.withOpacity(0.3),
            ),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "7+",
              style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold),
            ),
          ),
          const Text("1h 25m", style: TextStyle(color: Colors.white38, fontSize: 14))
        ],
      ),
    ),
  );
}