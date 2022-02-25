import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerBars extends StatelessWidget {
  const ShimmerBars({Key? key, this.width}) : super(key: key);
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 10,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
    );
  }
}
