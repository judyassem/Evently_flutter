import 'package:evently/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_styles.dart';

class LanguageToggle extends StatefulWidget{
  final String text;
  final bool value;

  const LanguageToggle({super.key, required this.text, required this.value});

  @override
  State<LanguageToggle> createState() => _TogglesState();
}

class _TogglesState extends State<LanguageToggle> {
  late LanguageProvider languageProvider;
  //late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    //themeProvider = Provider.of(context);
    return Row(
      children: [
        Text(widget.text ,style: AppStyles.textTheme.displayMedium,),
        Spacer(),
        Switch(value: widget.value, onChanged: (newValue){
          setState((){
            //themeProvider.updateTheme(newValue? ThemeMode.dark : ThemeMode.light);
            languageProvider.updateLocale(newValue ? "ar" : "en" );
          });
        }),
      ],);
  }
}
