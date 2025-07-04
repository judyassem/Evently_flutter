import 'package:evently/core/app_styles.dart';
import 'package:evently/providers/app_provider.dart';
import 'package:evently/screens/Authentication/login.dart';
import 'package:evently/screens/home/homeTab/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: ChangeNotifierProvider(
        create: (_) => LanguageProvider(),
        child: const MyApp()),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider langProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'), 
      ],
      locale: Locale(langProvider.currentLocale),
      theme:AppStyles.lightTheme,
      darkTheme: AppStyles.darkTheme,
      themeMode: themeProvider.theme,

      home: Login(),
    );
  }
}
