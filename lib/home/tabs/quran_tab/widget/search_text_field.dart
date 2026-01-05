import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class SearchTextField extends StatelessWidget {
  final Function searchFunction;

  const SearchTextField({super.key, required this.searchFunction});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      onChanged: (text) {
        searchFunction(text);
      },
      cursorColor: AppColors.primaryColor,
      style: AppStyles.bold16White,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsGeometry.symmetric(vertical: 13),
        hintText: 'Sura Name',
        hintStyle: AppStyles.bold16White,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            width: 28,
            AppAssets.iconSearch,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        enabledBorder: builtDecorationBorder(),
        focusedBorder: builtDecorationBorder(),
      ),
    );
  }

  /// search field border ===============================================
  OutlineInputBorder builtDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
    );
  }
}
