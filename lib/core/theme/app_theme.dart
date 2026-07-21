import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/constants.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme =
    ThemeData(
      primarySwatch: createMaterialColor(primaryColor),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldColorLight,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFFFFFFF),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF1F2937)),
      textTheme: const TextTheme(titleLarge: TextStyle()),
      unselectedWidgetColor: Color(0xFF6B7280),
      dividerColor: dividerColor,
      cardColor: const Color(0xFFFFFFFF),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: BorderSide(color: borderColor.withAlpha(60)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: BorderSide(color: borderColor.withAlpha(40)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(color: borderColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: BorderSide(color: borderColor.withAlpha(60)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        alignLabelWithHint: true,
        isDense: true,
        labelStyle: primaryTextStyle(),
      ),
      dialogTheme: DialogThemeData(shape: dialogShape()),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        titleTextStyle: boldTextStyle(color: Colors.white),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
    ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );

    static final ThemeData darkTheme =
    ThemeData(
      primarySwatch: createMaterialColor(primaryColor),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldColorDark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: scaffoldSecondaryDark,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Color(0xFFD1D5DB)),
      ),
      unselectedWidgetColor: Color(0xFF9CA3AF),
      dividerColor: const Color(0xFF374151),
      cardColor: scaffoldSecondaryDark,
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: scaffoldSecondaryDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: BorderSide(color: borderColor.withAlpha(90)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: BorderSide(color: borderColor.withAlpha(50)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(color: borderColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: BorderSide(color: borderColor.withAlpha(90)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        alignLabelWithHint: true,
        isDense: true,
        labelStyle: primaryTextStyle(),
      ),
      dialogTheme: DialogThemeData(shape: dialogShape()),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
    ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );

  // static final ThemeData lightTheme =
  //     ThemeData(
  //       primarySwatch: createMaterialColor(primaryColor),
  //       primaryColor: primaryColor,
  //       scaffoldBackgroundColor: Colors.white,
  //       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //         backgroundColor: Colors.white,
  //       ),
  //       iconTheme: const IconThemeData(color: scaffoldSecondaryDark),
  //       textTheme: const TextTheme(titleLarge: TextStyle()),
  //       unselectedWidgetColor: Colors.black,
  //       dividerColor: viewLineColor,
  //       cardColor: Colors.white,
  //       inputDecorationTheme: InputDecorationThemeData(
  //         // fillColor: Colors.grey,
  //         filled: true,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: primaryColor.withAlpha(25)),
  //         ),
  //         focusedErrorBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: Colors.red),
  //         ),
  //         disabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: Colors.grey),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: primaryColor.withAlpha(25)),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: primaryColor.withAlpha(25)),
  //         ),
  //         errorBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: Colors.red),
  //         ),
  //         alignLabelWithHint: true,
  //         isDense: true,
  //         labelStyle: primaryTextStyle(),
  //       ),
  //       dialogTheme: DialogThemeData(shape: dialogShape()),
  //       appBarTheme: AppBarTheme(
  //         iconTheme: const IconThemeData(color: Colors.white),
  //         backgroundColor: primaryColor,
  //         titleTextStyle: boldTextStyle(color: Colors.white),
  //         systemOverlayStyle: const SystemUiOverlayStyle(
  //           statusBarColor: primaryColor,
  //           statusBarIconBrightness: Brightness.light,
  //           statusBarBrightness: Brightness.light,
  //         ),
  //       ),
  //     ).copyWith(
  //       pageTransitionsTheme: const PageTransitionsTheme(
  //         builders: <TargetPlatform, PageTransitionsBuilder>{
  //           TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
  //           TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
  //           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  //         },
  //       ),
  //     );

  // static final ThemeData darkTheme =
  //     ThemeData(
  //       primarySwatch: createMaterialColor(primaryColor),
  //       primaryColor: primaryColor,
  //       scaffoldBackgroundColor: scaffoldColorDark,
  //       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //         backgroundColor: scaffoldSecondaryDark,
  //       ),
  //       iconTheme: const IconThemeData(color: Colors.white),
  //       textTheme: const TextTheme(
  //         titleLarge: TextStyle(color: textSecondaryColor),
  //       ),
  //       unselectedWidgetColor: Colors.white60,
  //       dividerColor: Colors.white12,
  //       cardColor: scaffoldSecondaryDark,
  //       inputDecorationTheme: InputDecorationThemeData(
  //         filled: true,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: primaryColor.withAlpha(25)),
  //         ),
  //         focusedErrorBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: primaryColor.withAlpha(25)),
  //         ),
  //         disabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: primaryColor.withAlpha(25)),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: primaryColor.withAlpha(25)),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(defaultRadius),
  //           borderSide: BorderSide(color: primaryColor.withAlpha(25)),
  //         ),
  //         alignLabelWithHint: true,
  //         isDense: true,
  //         labelStyle: primaryTextStyle(),
  //       ),
  //       dialogTheme: DialogThemeData(shape: dialogShape()),
  //       appBarTheme: const AppBarTheme(
  //         backgroundColor: primaryColor,
  //         systemOverlayStyle: SystemUiOverlayStyle(
  //           statusBarIconBrightness: Brightness.light,
  //           statusBarBrightness: Brightness.dark,
  //         ),
  //       ),
  //     ).copyWith(
  //       pageTransitionsTheme: const PageTransitionsTheme(
  //         builders: <TargetPlatform, PageTransitionsBuilder>{
  //           TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
  //           TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
  //           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  //         },
  //       ),
  //     );
}
