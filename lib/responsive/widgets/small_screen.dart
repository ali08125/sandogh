import 'package:flutter/material.dart';
import 'package:sandogh/ui/users/users_screen.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: IconButton(
                    iconSize: 32,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.list_outlined,
                    ),
                  ))
            ],
          ),
          const Expanded(child: UsersScreen())
        ],
      ),
    );
  }
}
