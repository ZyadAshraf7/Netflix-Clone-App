import 'package:flutter/material.dart';
import 'package:netflix_app/app/presentation/widgets/container_shimmer.dart';

class ShimmerMoviesList extends StatelessWidget {
  const ShimmerMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(itemBuilder: (context,i){
        return const ContainerShimmer();
      }, separatorBuilder: (context,_){
        return const SizedBox(width: 7,);
      }, itemCount: 5),
    );
  }
}
