import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/provider/DarkTheme/app_theme.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final copyrightText = 'copyright'.tr();
    final titleNavBar = 'titlenavbar'.tr();
    final footerText = 'footer'.tr();
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Container(
          color:
              notifier.isDark ? CustomColor.scaffoldBg : CustomColor.scaffoldBg,
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: double.maxFinite,
          alignment: Alignment.center,
          child: Text(
            '$copyrightText $currentYear $titleNavBar $footerText',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: notifier.isDark
                  ? CustomColor.textFieldBg
                  : CustomColor.whitePrimary,
            ),
          ),
        );
      },
    );
  }
}
