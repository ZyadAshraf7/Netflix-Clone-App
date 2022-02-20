import 'package:flutter/material.dart';

Widget movieTextDetails(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.",
          style: TextStyle(
            color: Colors.white.withOpacity(0.83),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: "Starring: ",style: TextStyle(color: Colors.white38,fontWeight: FontWeight.bold,fontSize: 14,)
              ),
              TextSpan(
                  text: "adipiscing elit. Sit quam dui,\n",style: TextStyle(color: Colors.white38,fontSize: 14,)
              ),
              TextSpan(
                  text: "Director: ",style: TextStyle(color: Colors.white38,fontWeight: FontWeight.bold,fontSize: 14,)
              ),
              TextSpan(
                  text: "adipiscing elit",style: TextStyle(color: Colors.white38,fontSize: 14,)
              ),
            ],
          ),
        )
      ],
    ),
  );
}