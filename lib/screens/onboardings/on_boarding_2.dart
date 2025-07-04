import 'package:evently/core/context_extition.dart';
import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../../core/app_colors.dart';
import '../../core/app_styles.dart';

class OnBoarding2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.horizontalLogo,height: 50, width: 160,color: context.primaryColor,),
                Image.asset(AppAssets.onboarding3),
                Text(context.locale.eventPlanning, style:context.theme.textTheme.displayLarge, textAlign: TextAlign.start,),
                Text(context.locale.onBoarding2,
                  style: context.theme.textTheme.bodyLarge,),
              ],
            ),
          ),
        )
    );
  }

}