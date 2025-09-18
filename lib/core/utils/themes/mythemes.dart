import 'package:bookia/core/utils/colors/mycolors.dart';
import 'package:flutter/material.dart';

class Mythemes {
  static ThemeData lightTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xffE8ECF4),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Mycolors.lightError),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Mycolors.lightPrimary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Mycolors.lightError),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Mycolors.lightDivider),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Mycolors.lightDivider),
        ),
      ),
      scaffoldBackgroundColor: Mycolors.lightBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: Mycolors.lightSecondaryBackground,
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        actionsPadding: EdgeInsets.all(8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Mycolors.lightPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minimumSize: Size(double.infinity, 65),
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          elevation: 1,
          iconColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shadowColor: Mycolors.lightDivider,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(
            color: Mycolors.lightPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: Mycolors.lightSecondaryBackground,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        iconColor: Mycolors.lightPrimary,
        titleTextStyle: TextStyle(
          color: Mycolors.lightPrimary,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        minTileHeight: 55,
        tileColor: Mycolors.lightSecondaryBackground,
        style: ListTileStyle.list,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xff1F2937),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Mycolors.darkError),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Mycolors.darkPrimary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Mycolors.darkError),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Mycolors.darkDivider),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Mycolors.darkDivider),
        ),
      ),
      scaffoldBackgroundColor: Mycolors.darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: Mycolors.darkSecondaryBackground,
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        actionsPadding: EdgeInsets.all(8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Mycolors.darkPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minimumSize: Size(double.infinity, 65),
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          elevation: 1,
          iconColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shadowColor: Mycolors.darkDivider,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Mycolors.darkSecondaryBackground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minimumSize: Size(double.infinity, 65),
          textStyle: TextStyle(
            color: Mycolors.darkPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          elevation: 1,
          surfaceTintColor: Colors.transparent,
          shadowColor: Mycolors.darkDivider,
        ),
      ),
      cardTheme: CardThemeData(
        color: Mycolors.darkSecondaryBackground,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        iconColor: Mycolors.darkPrimary,
        titleTextStyle: TextStyle(
          color: Mycolors.darkPrimary,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        minTileHeight: 55,
        tileColor: Mycolors.darkSecondaryBackground,
        style: ListTileStyle.list,
      ),
    );
  }
}
