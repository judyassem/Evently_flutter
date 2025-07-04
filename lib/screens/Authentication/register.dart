import 'package:evently/common/custom_elevated_button.dart';
import 'package:evently/common/custom_input_field.dart';
import 'package:evently/common/Language_toggle.dart';
import 'package:evently/core/app_colors.dart';
import 'package:evently/core/app_routes.dart';
import 'package:evently/core/context_extition.dart';
import 'package:evently/firebase_helpers/firestore_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_assets.dart';
import '../../core/app_styles.dart';
import '../../core/dialog_utils.dart';
import '../../model/userDm.dart';
import '../../providers/app_provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  late LanguageProvider languageProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              buildAppLogo(),
              SizedBox(height: 8),
              buildNameField(),
              SizedBox(height: 8),
              buildEmailField(),
              SizedBox(height: 8),
              buildPasswordField(),
              SizedBox(height: 8),
              buildRePasswordField(),
              SizedBox(height: 8),
              buildCreateButton(),
              SizedBox(height: 8),
              buildHaveAccount(),
              SizedBox(height: 8),
              buildToggle(),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() => AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    ),
    centerTitle: true,
    title: Text(
      context.locale.register,
      style: context.theme.textTheme.bodyLarge,
    ),
    //backgroundColor: AppColors.pureWhite,
  );

  buildAppLogo() => Image.asset(AppAssets.logo, color: context.primaryColor);

  buildNameField() => CustomInputField(
    controller: nameController,
    prefixIcon: Icon(Icons.person),
    label: context.locale.name,
  );

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

  buildRePasswordField() => CustomInputField(
    prefixIcon: Icon(Icons.lock),
    label: context.locale.rePassword,
    controller: rePasswordController,
    isPassword: true,
  );

  buildCreateButton() => CustomElevatedButton(
    text: context.locale.createAccount,
    onClick: () async {
      try {
        showLoading(context);
        final credentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        var user = UserDm(
          id: credentials.user!.uid,
          email: emailController.text,
          name: nameController.text,
        );
        await addUserToFirestore(user);
        hideLoading(context);
        Navigator.pop(context);
      } on FirebaseAuthException catch (ex) {
        hideLoading(context);
        var message = "";
        message = ex.message ?? "Something went wrong";
        showMessage(
          title: "ERROR",
          negActionText: "go back",
          context: context,
          message: message,
        );
      }
    },
  );

  buildHaveAccount() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        context.locale.haveAccount,
        style: context.theme.textTheme.bodyLarge,
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          context.locale.login,
          style: context.theme.textTheme.displayMedium!.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );

  buildToggle() => LanguageToggle(
    text: context.locale.language,
    value: languageProvider.isAr,
  );
}
