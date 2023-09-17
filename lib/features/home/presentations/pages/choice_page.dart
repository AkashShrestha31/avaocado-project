import 'package:avocado/core/components/custom_button_widget.dart';
import 'package:avocado/core/helper_class/size_config.dart';
import 'package:avocado/core/helper_class/spacing_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().initialize(context: context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonWidget(
              text: "GET API",
              callback: () {
                GoRouter.of(context).push("/apiPost");
              },
            ),
            SizeHelper.vSpacing(vSpace: Spacing.medium),
            CustomButtonWidget(
              text: "Figma Design",
              callback: () {
                GoRouter.of(context).push("/video");
              },
            )
          ],
        ),
      ),
    );
  }
}
