import 'package:evently/common/custom_elevated_button.dart';
import 'package:evently/core/app_assets.dart';
import 'package:evently/core/app_colors.dart';
import 'package:evently/core/context_extition.dart';
import 'package:flutter/material.dart';

import '../../core/app_routes.dart';

class ForgetPassword extends StatelessWidget{
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:  AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(context, AppRoutes.login);
              },
              icon: Icon(Icons.arrow_back, color: context.secondaryColor,),
            ),
            centerTitle: true,
            title: Text(context.locale.forgetPassword, style: context.theme.textTheme.bodyLarge,),
            //backgroundColor: AppColors.pureWhite,
          ),
          body: Column(
            children: [
              SizedBox(height: 16,),
              Image.asset(AppAssets.forgetPassword),
              SizedBox(height: 16,),
              CustomElevatedButton(text: context.locale.resetPassword, onClick: (){})
            ],
          ),

        ));
  }
}
