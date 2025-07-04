import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtition on BuildContext{
  AppLocalizations get locale{
    return AppLocalizations.of(this)!;
  }
  ThemeData get theme{
    return Theme.of(this);
  }
  Color get primaryColor{
    return theme.primaryColor;
  }
  Color get secondaryColor{
    return theme.colorScheme.secondary;
  }
  Color get tertiaryColor{
    return theme.colorScheme.tertiary;
  }
}