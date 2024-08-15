import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/provider/DarkTheme/app_theme.dart';
import 'package:portfolio_flutter/utils/ProjectsUtils/projects_utils.dart';
import 'package:portfolio_flutter/widgets/ProjectsCard/projects_card.dart';
import 'package:provider/provider.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<UiProvider>(builder: (context, notifier, child) {
      return Container(
        width: screenWidth,
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        child: Column(
          children: [
            // Work projects title
            Text(
              "workprojects".tr(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: notifier.isDark
                    ? CustomColor.textFieldBg
                    : CustomColor.hintDark,
              ),
            ),
            const SizedBox(height: 50),
            // Work projects cards
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Wrap(
                spacing: 25,
                runSpacing: 25,
                children: [
                  for (int i = 0; i < workProjectUtils.length; i++)
                    ProjectCardWidget(
                      project: workProjectUtils[i],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            // Hobby projects title
            Text(
              "hobbyprojects".tr(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: notifier.isDark
                    ? CustomColor.textFieldBg
                    : CustomColor.hintDark,
              ),
            ),
            const SizedBox(height: 50),
            // Hobby projects cards
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Wrap(
                spacing: 25,
                runSpacing: 25,
                children: [
                  for (int i = 0; i < hobbyProjectUtils.length; i++)
                    ProjectCardWidget(
                      project: hobbyProjectUtils[i],
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
