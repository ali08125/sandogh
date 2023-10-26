import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandogh/theme.dart';

class SearchField extends StatelessWidget {
  final Function(String value) search;
  const SearchField({
    super.key,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 56,
      child: TextField(
        onChanged: (value) {
          search(value);
        },
        style: const TextStyle(color: Colors.blue),
        decoration: InputDecoration(
          
          hintText: 'جستجوی کاربر...',
          hintStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: LightThemeColor.gray),
          prefixIcon: const Icon(
            Iconsax.search_normal_1,
            size: 20,
            color: LightThemeColor.gray,
          ),
          
        ),
      ),
    );
  }
}
