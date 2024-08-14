import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/constants/Links/links.dart';
import 'package:portfolio_flutter/provider/DarkTheme/app_theme.dart';
import 'package:provider/provider.dart';
import 'dart:js' as js;

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 30.0,
          ),
          height: screenHeight,
          constraints: const BoxConstraints(
            minHeight: 560.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // avatar img
              ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(colors: [
                    CustomColor.scaffoldBg.withOpacity(0.3),
                    CustomColor.scaffoldBg.withOpacity(0.3),
                  ]).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/profile.jpg",
                      width: screenWidth / 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // intro message
              Text(
                "textmain".tr(),
                style: const TextStyle(
                  fontSize: 24,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(
                    width: 140,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        js.context.callMethod('open', [SnsLinks.github]);
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                        size: 20,
                      ),
                      label: Text("github".tr()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 140,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        js.context.callMethod('open', [SnsLinks.linkedIn]);
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        size: 20,
                      ),
                      label: Text("linkedin".tr()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Theme switch toggle
                  Switch(
                    activeColor: CustomColor.bgLight1,
                    inactiveTrackColor: CustomColor.hintDark,
                    value: notifier.isDark,
                    onChanged: (value) => notifier.changeTheme(),
                  ),
                  const Icon(
                    Icons.dark_mode,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
