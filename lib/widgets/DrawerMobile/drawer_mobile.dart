import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/constants/NavItems/nav_items.dart';
import 'package:portfolio_flutter/provider/DarkTheme/app_theme.dart';
import 'package:provider/provider.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });

  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Drawer(
          backgroundColor: notifier.isDark
              ? CustomColor.scaffoldBg
              : CustomColor.whitePrimary,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    bottom: 20,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
              for (int i = 0; i < navIcons.length && i < navTitles.length; i++)
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  titleTextStyle: const TextStyle(
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  onTap: () {
                    onNavItemTap(i);
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    navIcons[i],
                    color: notifier.isDark
                        ? CustomColor.textFieldBg
                        : CustomColor.hintDark,
                  ),
                  title: Text(
                    navTitles[i],
                    style: TextStyle(
                      color: notifier.isDark
                          ? CustomColor.textFieldBg
                          : CustomColor.hintDark,
                    ),
                  ),
                ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                leading: const Icon(
                  Icons.dark_mode,
                  size: 20,
                ),
                title: Text(
                  'darkmode'.tr(),
                  style: TextStyle(
                    color: notifier.isDark
                        ? CustomColor.textFieldBg
                        : CustomColor.hintDark,
                  ),
                ),
                // Theme switch toggle
                trailing: Switch(
                  activeColor: CustomColor.whitePrimary,
                  inactiveTrackColor: CustomColor.hintDark,
                  value: notifier.isDark,
                  onChanged: (value) => notifier.changeTheme(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
