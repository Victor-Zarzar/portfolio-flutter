import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/constants/NavItems/nav_items.dart';
import 'package:portfolio_flutter/provider/DarkTheme/app_theme.dart';
import 'package:portfolio_flutter/widgets/SiteLogo/site_logo.dart';
import 'package:provider/provider.dart';

class NavDesktop extends StatelessWidget {
  const NavDesktop({
    super.key,
    required this.onNavMenuTap,
  });

  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Container(
          height: 60,
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.transparent, CustomColor.bgLight1],
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              SiteLogo(
                onTap: () {},
              ),
              const Spacer(),
              for (int i = 0; i < navTitles.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: () => onNavMenuTap(i),
                    child: Text(
                      navTitles[i],
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: notifier.isDark
                            ? CustomColor.textFieldBg
                            : CustomColor.whitePrimary,
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 20),
              // Theme switch toggle
              Switch(
                activeColor: CustomColor.whitePrimary,
                inactiveTrackColor: CustomColor.textFieldBg,
                value: notifier.isDark,
                onChanged: (value) => notifier.changeTheme(),
              ),
              Icon(
                Icons.dark_mode,
                size: 18,
                color: notifier.isDark
                    ? CustomColor.whitePrimary
                    : CustomColor.whitePrimary,
              ),
            ],
          ),
        );
      },
    );
  }
}
