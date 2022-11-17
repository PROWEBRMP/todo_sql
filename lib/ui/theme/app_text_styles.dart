import 'package:flutter/cupertino.dart';
import 'package:sqllite_example/ui/theme/app_colors.dart';

class AppTextStyles {
  static const appBartitle = TextStyle(
    fontSize: 22,
    height: 1.27,
    color: AppColors.primaryDarkColor,
  );
  static const noteTitle = TextStyle(
    fontSize: 16,
    height: 1.18,
    color: AppColors.primaryDarkColor,
    fontWeight: FontWeight.w500,
  );
  static const noteDate = TextStyle(
    fontSize: 14,
    height: 1.42,
    color: AppColors.greyColor,
  );
  static const note = TextStyle(
    fontSize: 14,
    height: 1.14,
    color: AppColors.secondaryDarkColor,
  );
}
