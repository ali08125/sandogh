import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandogh/constants/controllers.dart';
import 'package:sandogh/responsive/widgets/side_navigation.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            const Expanded(flex: 1, child: SideNavigation()),
            Expanded(
              flex: 5,
              child: menuController.returnPageFor(),
            ),
          ],
        ));
  }
}
