import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandogh/constants/controllers.dart';
import 'package:sandogh/constants/icons.dart';
import 'package:sandogh/constants/titles.dart';
import 'package:sandogh/routing/routes.dart';
import 'package:sandogh/theme.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 62),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.strongbox5,
                  size: 38,
                  color: themeData.colorScheme.primary,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'صندوق',
                  style: themeData.textTheme.titleLarge,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: icons.length,
              itemBuilder: (context, index) => SideItem(
                icon: icons[index],
                title: titles[index],
                itemName: sideMenuItems[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SideItem extends StatelessWidget {
  final Icon icon;
  final String title;
  final String itemName;
  const SideItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            menuController.changeActiveItemTo(itemName);
          },
          onHover: (value) {
            value
                ? menuController.onHover(itemName)
                : menuController.onHover('not hovering');
          },
          child: Container(
            color: menuController.isHovering(itemName)
                ? Colors.grey.withOpacity(0.1)
                : Colors.transparent,
            width: double.infinity,
            height: 56,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                menuController.returnIconFor(itemName),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: menuController.isActive(itemName)
                          ? Colors.black
                          : LightThemeColor.gray),
                )
              ],
            ),
          ),
        ));
  }
}
