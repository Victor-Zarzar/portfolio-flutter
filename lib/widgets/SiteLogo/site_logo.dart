import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'titlenavbar'.tr(),
        style: GoogleFonts.jetBrainsMono(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: CustomColor.yellowSecondary,
        ),
      ),
    );
  }
}
