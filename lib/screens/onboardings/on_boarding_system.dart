import 'package:evently/core/app_colors.dart';
import 'package:evently/core/app_routes.dart';
import 'package:evently/core/context_extition.dart';
import 'package:evently/screens/onboardings/on_boarding_1.dart';
import 'package:evently/screens/onboardings/on_boarding_2.dart';
import 'package:evently/screens/onboardings/on_boarding_3.dart';
import 'package:flutter/material.dart';

class OnBoardingSystem extends StatefulWidget{
  const OnBoardingSystem({super.key});

  @override
  State<OnBoardingSystem> createState() => _OnBoardingSystemState();
}

class _OnBoardingSystemState extends State<OnBoardingSystem> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              OnBoarding1(),
              OnBoarding2(),
              OnBoarding3(),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: _currentPage == index ? 20 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? context.primaryColor : context.theme.colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: context.primaryColor),borderRadius: BorderRadius.circular(25)),
              child: IconButton(
                icon: Icon(Icons.arrow_back,color: context.primaryColor,),
                onPressed: () {
                  if (_currentPage > 0) {
                    print(_currentPage);
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                  else{
                    print(_currentPage);
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: context.primaryColor),borderRadius: BorderRadius.circular(25)),
              child: IconButton(
                icon: Icon(Icons.arrow_forward,color: context.primaryColor,),
                onPressed: () {
                  print(_currentPage);
                  if (_currentPage < 2) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                  else{
                    print(_currentPage);
                    Navigator.push(context, AppRoutes.login);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}