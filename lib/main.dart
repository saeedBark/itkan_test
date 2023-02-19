import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itkan_test/bloc_observ/bloc_observ.dart';
import 'package:itkan_test/dio/dio.dart';
import 'package:itkan_test/screens/home/cubit.dart';
import 'package:itkan_test/screens/login/login_screen.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  DioHolper.init();
  runApp(MyBook());
}

class MyBook extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit()..getHomeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        home: AnimatedSplashScreen(
          splash: Image.asset(
            'assets/images/itkan.jpg',
            fit: BoxFit.cover,
          ),
          nextScreen: LoginScreen(),
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.fadeTransition,
          //  pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.transparent,
          duration: 1000,
        ),
      ),
    );
  }
}


