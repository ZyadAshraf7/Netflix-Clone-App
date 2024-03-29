import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/bottom_navbar_cubit/bottom_nav_bar_cubit.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/screens/bottom_navbar_screen/widgets/bottom_nav_icon.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/home_screen.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavBarCubit = BlocProvider.of<BottomNavBarCubit>(context);
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: bottomNavBarCubit.screens[bottomNavBarCubit.currentIndex],
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(bottom: 5,top: 1),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              child: BottomNavigationBar(
                selectedFontSize: 12,
                unselectedFontSize:10 ,
                selectedItemColor: Colors.white,
                unselectedItemColor: AppTheme.darkGrey,
                type: BottomNavigationBarType.fixed,
                onTap: bottomNavBarCubit.navigateScreens,
                currentIndex: bottomNavBarCubit.currentIndex,
                showUnselectedLabels: true,
                backgroundColor: const Color(0xff121212),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: BottomNavIcon(
                      iconPath: 'assets/images/icons/home.svg',
                      isSelected: bottomNavBarCubit.currentIndex == 0,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Search',
                    icon: BottomNavIcon(
                      iconPath: 'assets/images/icons/Search.svg',
                      isSelected: bottomNavBarCubit.currentIndex == 1,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'New & Hot',
                    icon: BottomNavIcon(
                      iconPath: 'assets/images/icons/coming-soon.svg',
                      isSelected: bottomNavBarCubit.currentIndex == 2,
                    ),
                  ),
                  /*BottomNavigationBarItem(
                    label: 'Downloads',
                    icon: BottomNavIcon(
                      iconPath: 'assets/images/icons/download.svg',
                      isSelected: bottomNavBarCubit.currentIndex == 3,
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
