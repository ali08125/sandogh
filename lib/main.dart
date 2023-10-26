import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandogh/controllers/menu_controller.dart';
import 'package:sandogh/data/repo/auth_repository.dart';
import 'package:sandogh/ui/layout.dart';
import 'package:sandogh/theme.dart';



void main() async {
  Get.put(MenuController1());
  await authRepository.loginAtStart();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(fontFamily: 'IRANSansX');

    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.3), width: 1))),
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      LightThemeColor.secondaryColor))),
          textTheme: TextTheme(
            bodyMedium: defaultTextStyle.copyWith(
                fontSize: 14,
                color: const Color(0xff808192),
                fontWeight: FontWeight.w400),
            titleLarge: defaultTextStyle.copyWith(
                fontSize: 22, fontWeight: FontWeight.w700),
            titleMedium: defaultTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          scaffoldBackgroundColor: LightThemeColor.backGroundColor,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          }),
          colorScheme: const ColorScheme.light(
              background: LightThemeColor.backGroundColor,
              onBackground: LightThemeColor.onBackgroundColor,
              primary: LightThemeColor.primaryColor,
              secondary: LightThemeColor.secondaryColor),
        ),
        home:  Directionality(
          textDirection: TextDirection.rtl,
          child: SiteLayout()
          // SiteLayout(),
          // AuthScreen()
          // AuthScreen()
          // AuthRepository.authChangeNotifir.value != null &&
          //         AuthRepository
          //             .authChangeNotifir.value!.accessToken.isNotEmpty
          //     ? const SiteLayout()
          //     : AuthScreen()),
        ));
  }
}
