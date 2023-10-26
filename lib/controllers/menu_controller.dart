import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandogh/routing/routes.dart';
import 'package:sandogh/theme.dart';
import 'package:sandogh/ui/accounts/accounts_screen.dart';
import 'package:sandogh/ui/loan/loan_screen.dart';
import 'package:sandogh/ui/users/users_screen.dart';

class MenuController1 extends GetxController {
  static MenuController1 instance = Get.find();
  var activeItem = usersPageRoute.obs;
  var hoverItem = ''.obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) {
      hoverItem.value = itemName;
    }
  }

  bool isActive(String itemName) => activeItem.value == itemName;

  bool isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case usersPageRoute:
        return _customIcon(Iconsax.profile_2user, itemName);
      case accountsPageRoute:
        return _customIcon(Iconsax.cards, itemName);
      case installmentsPageRoute:
        return _customIcon(Iconsax.receipt_text, itemName);
      case transactionsPageRoute:
        return _customIcon(Iconsax.cards, itemName);
      case inboxPageRoute:
        return _customIcon(Iconsax.direct, itemName);

      default:
        return Container();
    }
  }

  Widget returnPageFor() {
    switch (activeItem.value) {
      case usersPageRoute:
        return const UsersScreen();
      case accountsPageRoute:
        return const AccountScreen();
      case installmentsPageRoute:
        return const LoanScreen();
      case transactionsPageRoute:
        return Container(
          color: Colors.amber,
        );
      case inboxPageRoute:
        return Container(
          color: Colors.cyan,
        );

      default:
        return Container();
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    return Icon(
      icon,
      color: isActive(itemName)
          ? LightThemeColor.primaryColor
          : LightThemeColor.gray,
    );
  }
}
