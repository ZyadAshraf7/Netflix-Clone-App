import 'package:flutter/material.dart';
import 'package:netflix_app/app/presentation/widgets/container_shimmer.dart';
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
              children: const [
                ContainerShimmer(
                  height: 130,
                  width: 280,
                  borderRadius: 7,
                ),
                SizedBox(height: 20),
                ContainerShimmer(
                  height: 30,
                  width: 330,
                  borderRadius: 3,
                ),
                SizedBox(height: 20),
                ContainerShimmer(
                  height: 40,
                  width: 90,
                  borderRadius: 5,
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

