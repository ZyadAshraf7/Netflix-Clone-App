import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/presentation/screens/authentications/screens/email_verfifcation_screen.dart';
import 'package:netflix_app/app/presentation/screens/authentications/screens/login_screen.dart';
import 'package:netflix_app/app/presentation/screens/authentications/screens/register_screen.dart';
import 'package:netflix_app/app/presentation/screens/coming_soon_screen/coming_soon_screen.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/home_screen.dart';
import 'package:netflix_app/app/presentation/screens/search_screen/search_screen.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  int currentIndex=0;

  List <Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
     ComingSoonScreen(),
    const RegisterScreen(),

  ];
  void navigateScreens(int index){
    currentIndex=index;
    emit(NavBarChangeScreenState());
  }

}
