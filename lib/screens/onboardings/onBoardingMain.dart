import 'package:evently/common/Language_toggle.dart';
import 'package:evently/core/app_assets.dart';
import 'package:evently/core/app_colors.dart';
import 'package:evently/core/app_routes.dart';
import 'package:evently/core/app_styles.dart';
import 'package:evently/core/context_extition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_provider.dart';

class OnBoardingMain extends StatefulWidget {
  const OnBoardingMain({super.key});

  @override
  State<OnBoardingMain> createState() => _OnBoardingMainState();
}

class _OnBoardingMainState extends State<OnBoardingMain> {
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.horizontalLogo,
                height: 50,
                width: 160,
                color: AppColors.blue,
              ),
              Image.asset(AppAssets.onboarding1),
              Text(
                context.locale.personalizeExperience,
                style: context.theme.textTheme.displayLarge,
                textAlign: TextAlign.start,
              ),
              Text(
                context.locale.onBoardingMain,
                style: context.theme.textTheme.bodyLarge,
              ),
              LanguageToggle(
                text: context.locale.language,
                value: languageProvider.isAr,
              ),
              Row(
                children: [
                  Text(
                    context.locale.theme,
                    style: AppStyles.textTheme.displayMedium,
                  ),
                  Spacer(),
                  Switch(
                    value: themeProvider.isDark,
                    onChanged: (newValue) {
                      setState(() {
                        themeProvider.updateTheme(
                          newValue ? ThemeMode.dark : ThemeMode.light,
                        );
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, AppRoutes.onBoardingSystem);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.all(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(context.locale.start)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
