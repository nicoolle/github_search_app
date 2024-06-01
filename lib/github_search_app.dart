import 'package:flutter/material.dart';
import 'package:ledsdoit/routing/app_router.dart';

import 'constants/app_colors.dart';

class GithubSearchApp extends StatelessWidget {
  const GithubSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter(),
      theme: ThemeData(
        fontFamily: 'Raleway',
        appBarTheme: const AppBarTheme(
          centerTitle:  true,
        ),
        listTileTheme: const ListTileThemeData(
          tileColor: AppColors.greyLayer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.normal,
          ),
          filled: true,
        //  fillColor: const Color(0xFFF8F9FA),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.blue, width: 2.0),
          ),
        ),
      ),
    );
  }
}
