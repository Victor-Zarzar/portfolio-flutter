import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/constants/Links/links.dart';
import 'dart:js' as js;

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

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
              Text(
                "textmain".tr(),
                style: const TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 15),
              // contact buttons
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
                ],
              ),
            ],
          ),
          CircleAvatar(
            radius: (150),
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.asset(
                "assets/profile.jpg",
                width: screenWidth / 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
