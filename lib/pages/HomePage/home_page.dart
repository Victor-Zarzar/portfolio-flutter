import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/constants/Size/size.dart';
import 'package:portfolio_flutter/provider/DarkTheme/app_theme.dart';
import 'package:portfolio_flutter/widgets/ContactSection/contact_section.dart';
import 'package:portfolio_flutter/widgets/DrawerMobile/drawer_mobile.dart';
import 'package:portfolio_flutter/widgets/Footer/footer.dart';
import 'package:portfolio_flutter/widgets/MainDesktop/main_desktop.dart';
import 'package:portfolio_flutter/widgets/MainMobile/main_mobile.dart';
import 'package:portfolio_flutter/widgets/NavDesktop/nav_desktop.dart';
import 'package:portfolio_flutter/widgets/NavMobile/nav_mobile.dart';
import 'package:portfolio_flutter/widgets/ProjectsSection/projects_section.dart';
import 'package:portfolio_flutter/widgets/SkillsDesktop/skills_desktop.dart';
import 'package:portfolio_flutter/widgets/SkillsMobile/skills_mobile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Consumer<UiProvider>(builder: (context, notifier, child) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: notifier.isDark
              ? CustomColor.scaffoldBg
              : CustomColor.whitePrimary,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : DrawerMobile(onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                }),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),
                // MAIN //
                if (constraints.maxWidth >= kMedDesktopWidth)
                  NavDesktop(onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                  })
                else
                  NavMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                if (constraints.maxWidth >= kMinDesktopWidth)
                  const MainDesktop()
                else
                  const MainMobile(),
                // SKILLS //
                Container(
                  key: navbarKeys[1],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: notifier.isDark
                      ? CustomColor.scaffoldBg
                      : CustomColor.whitePrimary,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title
                      Text(
                        'skills'.tr(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: notifier.isDark
                              ? CustomColor.textFieldBg
                              : CustomColor.hintDark,
                        ),
                      ),
                      const SizedBox(height: 50),

                      // platforms and skills
                      if (constraints.maxWidth >= kMedDesktopWidth)
                        const SkillsDesktop()
                      else
                        const SkillsMobile(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // PROJECTS //
                ProjectsSection(
                  key: navbarKeys[2],
                ),
                const SizedBox(height: 30),
                // CONTACT //
                ContactSection(
                  key: navbarKeys[3],
                ),
                const SizedBox(height: 30),
                // FOOTER //
                const Footer(),
              ],
            ),
          ),
        );
      });
    });
  }
}
