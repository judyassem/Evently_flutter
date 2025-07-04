import 'package:evently/common/custom_elevated_button.dart';
import 'package:evently/common/custom_input_field.dart';
import 'package:evently/common/Language_toggle.dart';
import 'package:evently/core/app_assets.dart';
import 'package:evently/core/app_colors.dart';
import 'package:evently/core/app_routes.dart';
import 'package:evently/core/app_styles.dart';
import 'package:evently/core/context_extition.dart';
import 'package:evently/firebase_helpers/firestore_helper.dart';
import 'package:evently/model/userDm.dart';
import 'package:evently/providers/app_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/dialog_utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late LanguageProvider languageProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildLogo(),
              SizedBox(height: 16),
              buildEmailField(),
              SizedBox(height: 16),
              buildPasswordField(),
              SizedBox(height: 8),
              buildForgetPass(),
              SizedBox(height: 8),
              buildLoginButton(),
              SizedBox(height: 8),
              buildCreateAccount(),
              SizedBox(height: 8),
              buildOrRow(),
              SizedBox(height: 8),
              buildGoogleButton(),
              SizedBox(height: 8),
              buildToggle(),
            ],
          ),
        ),
      ),
    );
  }

  buildLogo() => Image.asset(AppAssets.logo, color: AppColors.blue);

  buildEmailField() => CustomInputField(
    prefixIcon: Icon(Icons.email),
    label: context.locale.email,
    controller: emailController,
  );

  buildPasswordField() => CustomInputField(
    prefixIcon: Icon(Icons.lock),
    label: context.locale.password,
    controller: passwordController,
    isPassword: true,
  );

  buildForgetPass() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: () {
          Navigator.push(context, AppRoutes.forgetPassword);
        },
        child: Text(
          context.locale.forgetPassword,
          style: context.theme.textTheme.displayMedium!.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );

  buildLoginButton() => CustomElevatedButton(
    text: context.locale.login,
    onClick: () async {
      try {
        showLoading(context);
        final credentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        UserDm.currentUser = await getUserFromFirestore(credentials.user!.uid);
        hideLoading(context);
        Navigator.push(context, AppRoutes.home);
      } on FirebaseAuthException catch (ex) {
        hideLoading(context);
        var message = "";
        message = ex.message ?? "Something went wrong";
        showMessage(
          title: "ERROR",
          posActionText: "accept",
          negActionText: "cancel",
          context: context,
          message: message,
        );
      }
    },
  );

  buildCreateAccount() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        context.locale.dontHaveAccount,
        style: context.theme.textTheme.bodyLarge,
      ),
      TextButton(
        onPressed: () {
          Navigator.push(context, AppRoutes.register);
        },
        child: Text(
          context.locale.createAccount,
          style: context.theme.textTheme.displayMedium!.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );

  buildOrRow() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Divider(
          color: context.primaryColor,
          thickness: 2,
          endIndent: 16,
        ),
      ),
      Text(context.locale.or, style: context.theme.textTheme.displaySmall),
      Expanded(
        child: Divider(color: context.primaryColor, thickness: 2, indent: 16),
      ),
    ],
  );

  buildGoogleButton() => CustomElevatedButton(
    text: context.locale.loginWithGoogle,
    onClick: () {},
    backgroundColor: Colors.transparent,
    foregroundColor: context.primaryColor,
    elevation: 0,
    icon: Image.asset(AppAssets.googleLogo),
  );

  buildToggle() => LanguageToggle(
    text: context.locale.language,
    value: languageProvider.isAr,
  );
}
