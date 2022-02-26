import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviesShimmer extends StatelessWidget {
  const MoviesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => Shimmer.fromColors(
          baseColor: Colors.grey.shade900,
          highlightColor: Colors.grey.shade800.withAlpha(60),
          child: Container(
            margin: const EdgeInsets.all(4),
            width: 100,
            color: Colors.grey.shade900,
          ),
        ),
      ),
    );
  }
}
