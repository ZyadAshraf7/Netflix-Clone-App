import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/data/models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<GetUserDataCubit>(context);

    return BlocConsumer<GetUserDataCubit, GetUserDataState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is LoadingUserData) {
          return const Center(child: CircularProgressIndicator(color: AppTheme.redPrimaryColor,));
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: profileCubit.userModel?.photoUrl==""?const DecorationImage(
                        image: AssetImage("assets/images/child2.png"),
                        fit: BoxFit.cover,
                      ):DecorationImage(
                        image: NetworkImage("${profileCubit.userModel?.photoUrl}"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                      border: Border.all(
                        color: AppTheme.redPrimaryColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    profileCubit.userModel!.userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        profileCubit.userModel!.email,
                        style:const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 3),
                      SvgPicture.asset("assets/images/icons/verified-badge.svg",height: 20,width: 20,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
