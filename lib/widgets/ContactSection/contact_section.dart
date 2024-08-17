import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/constants/Links/links.dart';
import 'package:portfolio_flutter/constants/Size/size.dart';
import 'package:portfolio_flutter/provider/DarkTheme/app_theme.dart';
import 'package:portfolio_flutter/widgets/CustomTextFields/custom_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:js' as js;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Container(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
          color: notifier.isDark
              ? CustomColor.scaffoldBg
              : CustomColor.whitePrimary,
          child: Column(
            children: [
              // title
              Text(
                "getintouch".tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: notifier.isDark
                      ? CustomColor.textFieldBg
                      : CustomColor.hintDark,
                ),
              ),

              const SizedBox(height: 50),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                  maxHeight: 100,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth >= kMinDesktopWidth) {
                      return buildNameEmailFieldDesktop();
                    }

                    // else
                    return buildNameEmailFieldMobile();
                  },
                ),
              ),
              const SizedBox(height: 15),
              // message
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                child: CustomTextField(
                  hintText: "yourmessage".tr(),
                  maxLines: 16,
                ),
              ),
              const SizedBox(height: 20),
              // send button
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton.icon(
                    icon: FaIcon(
                      FontAwesomeIcons.solidPaperPlane,
                      size: 18,
                      color: notifier.isDark
                          ? CustomColor.hintDark
                          : CustomColor.whitePrimary,
                    ),
                    onPressed: () {},
                    label: Text(
                      "submit".tr(),
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
              ),
              const SizedBox(height: 30),

              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 300,
                ),
                child: const Divider(),
              ),
              const SizedBox(height: 15),

              // SNS icon button links
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [SnsLinks.github]);
                    },
                    child: FaIcon(
                      FontAwesomeIcons.github,
                      size: 28,
                      color: notifier.isDark
                          ? CustomColor.textFieldBg
                          : CustomColor.hintDark,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [SnsLinks.dev]);
                    },
                    child: FaIcon(
                      FontAwesomeIcons.dev,
                      size: 28,
                      color: notifier.isDark
                          ? CustomColor.textFieldBg
                          : CustomColor.hintDark,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [SnsLinks.linkedIn]);
                    },
                    child: FaIcon(
                      FontAwesomeIcons.linkedin,
                      size: 28,
                      color: notifier.isDark
                          ? CustomColor.textFieldBg
                          : CustomColor.hintDark,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [SnsLinks.facebook]);
                    },
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 28,
                      color: notifier.isDark
                          ? CustomColor.textFieldBg
                          : CustomColor.hintDark,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [SnsLinks.instagram]);
                    },
                    child: FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 28,
                      color: notifier.isDark
                          ? CustomColor.textFieldBg
                          : CustomColor.hintDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            hintText: "yourname".tr(),
          ),
        ),
        const SizedBox(width: 15),
        // email
        Flexible(
          child: CustomTextField(
            hintText: "youremail".tr(),
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            hintText: "yourname".tr(),
          ),
        ),
        const SizedBox(height: 15),
        // email
        Flexible(
          child: CustomTextField(
            hintText: "youremail".tr(),
          ),
        ),
      ],
    );
  }
}
