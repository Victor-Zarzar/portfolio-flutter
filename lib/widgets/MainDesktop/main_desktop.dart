import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/constants/Links/links.dart';
import 'package:portfolio_flutter/provider/DarkTheme/app_theme.dart';
import 'package:provider/provider.dart';
import 'dart:js' as js;

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          height: screenHeight / 1.2,
          constraints: const BoxConstraints(
            minHeight: 350.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // intro message
                  Row(
                    children: [
                      Text(
                        "textmain".tr(),
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: notifier.isDark
                              ? CustomColor.textFieldBg
                              : CustomColor.hintDark,
                        ),
                      ),
                      Image.asset(
                        "assets/hi.gif",
                        height: 36,
                        width: 36,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "textwomain".tr(),
                      style: TextStyle(
                        fontSize: 30,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: notifier.isDark
                            ? CustomColor.textFieldBg
                            : CustomColor.hintDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  // contact buttons
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            js.context.callMethod('open', [SnsLinks.github]);
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                            size: 20,
                            color: notifier.isDark
                                ? CustomColor.hintDark
                                : CustomColor.whitePrimary,
                          ),
                          label: Text(
                            "github".tr(),
                            style: TextStyle(
                              color: notifier.isDark
                                  ? CustomColor.hintDark
                                  : CustomColor.whitePrimary,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: notifier.isDark
                                ? CustomColor.textFieldBg
                                : CustomColor.hintDark,
                            backgroundColor: notifier.isDark
                                ? CustomColor.textFieldBg
                                : CustomColor.hintDark, //
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 140,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            js.context.callMethod('open', [SnsLinks.linkedIn]);
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.linkedin,
                            size: 20,
                            color: notifier.isDark
                                ? CustomColor.hintDark
                                : CustomColor.whitePrimary,
                          ),
                          label: Text(
                            "linkedin".tr(),
                            style: TextStyle(
                              color: notifier.isDark
                                  ? CustomColor.hintDark
                                  : CustomColor.whitePrimary,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: notifier.isDark
                                ? CustomColor.textFieldBg
                                : CustomColor.hintDark,
                            backgroundColor: notifier.isDark
                                ? CustomColor.textFieldBg
                                : CustomColor.hintDark, //
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Flexible(
                child: CircleAvatar(
                  radius: (180),
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(180),
                    child: Image.asset(
                      "assets/profile.jpg",
                      width: screenWidth / 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
