import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/Colors/colors.dart';
import 'package:portfolio_flutter/constants/Links/links.dart';
import 'package:portfolio_flutter/constants/Size/size.dart';
import 'package:portfolio_flutter/widgets/CustomTextFields/custom_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // title
          Text(
            "getintouch".tr(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
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
                icon: const FaIcon(
                  FontAwesomeIcons.solidPaperPlane,
                  size: 18,
                ),
                onPressed: () {},
                label: Text("submit".tr()),
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
                child: const FaIcon(
                  FontAwesomeIcons.github,
                  size: 28,
                  color: CustomColor.whitePrimary,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.dev]);
                },
                child: const FaIcon(
                  FontAwesomeIcons.dev,
                  size: 28,
                  color: CustomColor.whitePrimary,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.linkedIn]);
                },
                child: const FaIcon(
                  FontAwesomeIcons.linkedin,
                  size: 28,
                  color: CustomColor.whitePrimary,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.facebook]);
                },
                child: const FaIcon(
                  FontAwesomeIcons.facebook,
                  size: 28,
                  color: CustomColor.whitePrimary,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.instagram]);
                },
                child: const FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 28,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ],
          ),
        ],
      ),
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
