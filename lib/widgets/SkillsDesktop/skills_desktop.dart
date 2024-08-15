import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/constants/Skillitems/skill_items.dart';
import 'package:portfolio_flutter/provider/DarkTheme/app_theme.dart';
import 'package:provider/provider.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // platforms
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 450,
              ),
              child: Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: [
                  for (int i = 0; i < platformItems.length; i++)
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: notifier.isDark
                            ? CustomColor.textFieldBg
                            : CustomColor.hintDark,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        leading: Image.asset(
                          platformItems[i]["img"],
                          width: 26.0,
                        ),
                        title: Text(
                          platformItems[i]["title"],
                          style: TextStyle(
                            color: notifier.isDark
                                ? CustomColor.hintDark
                                : CustomColor.whitePrimary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 50),

            // skills
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    for (int i = 0; i < skillItems.length; i++)
                      Chip(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        backgroundColor: notifier.isDark
                            ? CustomColor.textFieldBg
                            : CustomColor.hintDark,
                        label: Text(
                          skillItems[i]["title"],
                          style: TextStyle(
                            color: notifier.isDark
                                ? CustomColor.hintDark
                                : CustomColor.whitePrimary,
                          ),
                        ),
                        avatar: Image.asset(skillItems[i]["img"]),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
