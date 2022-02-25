import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PosterShimmer extends StatelessWidget {
  const PosterShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Shimmer.fromColors(
            child: Column(
              children: [
                Container(
                  height: 130,
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(7)
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height:30,
                  width: 330,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(3)
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height:40,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ],
            ),
            baseColor: Colors.grey.shade900,
            highlightColor: Colors.grey.shade800.withAlpha(60),
          ),
        ],
      ),
    );
  }
}

