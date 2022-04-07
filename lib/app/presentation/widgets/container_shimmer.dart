import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ContainerShimmer extends StatelessWidget {
  const ContainerShimmer({Key? key,this.height,this.width,this.borderRadius,this.child}) : super(key: key);
  final double?height,width,borderRadius;
  final Widget?child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: width??100,
        height: height??100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius??5),
          color: Colors.grey.shade900,
        ),
        child: child,
      ) ,
      baseColor: Colors.grey.shade900,
      highlightColor: Colors.grey.shade800.withAlpha(60),
    );
  }
}
