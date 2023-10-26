import 'package:flutter/material.dart';
import 'package:sandogh/data/repo/auth_repository.dart';
import 'package:sandogh/responsive/responsive.dart';
import 'package:sandogh/responsive/widgets/large_screen.dart';
import 'package:sandogh/responsive/widgets/side_navigation.dart';
import 'package:sandogh/responsive/widgets/small_screen.dart';
import 'package:sandogh/ui/auth/auth_screen.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        drawer: Drawer(
          child: SideNavigation(),
        ),
        body: 
             ResponsiveWidget(
                largeScreen: LargeScreen(),
                smallScreen: SmallScreen(),
              )
            );
  }
}
