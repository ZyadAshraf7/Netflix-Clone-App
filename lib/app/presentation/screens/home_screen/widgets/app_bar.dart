import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/widgets/container_shimmer.dart';

import 'app_bar_text.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({Key? key, required this.scrollOffset}) : super(key: key);
  double scrollOffset;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final profileCubit = BlocProvider.of<GetUserDataCubit>(context);
    // profileCubit.getUserData();
    return SingleChildScrollView(
      child: BlocConsumer<GetUserDataCubit, GetUserDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
            color: Colors.black.withOpacity((scrollOffset / 350).clamp(0, 0.8).toDouble()),
            //height: widget.scrollOffset<40?height:100,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: scrollOffset < 100
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/images/icons/netflix-n.svg",
                              width: 20,
                              height: 40,
                              color: AppTheme.redPrimaryColor,
                            ),
                            state is LoadingUserData
                                ? const ContainerShimmer(
                                    height: 35,
                                    width: 35,
                                  )
                                : const UserProfileBox(),
                          ],
                        )
                      : const SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    appBarText("TV Shows", () {}),
                    appBarText("Movies", () {}),
                    appBarText("My List", () {}),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class UserProfileBox extends StatelessWidget {
  const UserProfileBox({
    Key? key,
    //required this.profileCubit,
  }) : super(key: key);

 // final GetUserDataCubit profileCubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, RouteNames.userProfile),
        child: Container(
          padding: const EdgeInsets.all(2),
          height: 35,
          width: 35,
          decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(5)),
          child: BlocProvider.of<GetUserDataCubit>(context).userModel?.photoUrl==""
              ? Image.asset("assets/images/child2.png")
              : ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    "${BlocProvider.of<GetUserDataCubit>(context).userModel?.photoUrl}",
                  ),
                ),
        ),
      );
  }
}
