import 'package:evently/core/app_assets.dart';
import 'package:evently/core/app_colors.dart';
import 'package:evently/core/app_routes.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, AppRoutes.onBoardingMain);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.logo, color: AppColors.blue,),
            Image.asset(AppAssets.routeLogo, color: AppColors.blue,),
            ],
        ),  
    );
  }
}
