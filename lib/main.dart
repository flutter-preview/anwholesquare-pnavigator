// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
import 'spref/pref.dart' show PREF;

void main () {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int appColor = 3;
  bool isDark = false;

  void update (int status, dynamic data) {
      if (status == 1 && data is int) {
        appColor = data % 3;
        PREF.instance.prefs.then((value) => value.setInt(PREF.appColor, appColor));
        setState(() {});
      }
      if (status == 2 && data is bool) {
        isDark = data;
        PREF.instance.prefs.then((value) => value.setBool(PREF.isDark, isDark));
        setState(() {});
      }
  }

  @override
  void initState() {
    super.initState();
    PREF.instance.prefs.then((value) {
      appColor = value.getInt(PREF.appColor) ?? 3;
      isDark = value.getBool(PREF.isDark) ?? false;
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pNavigator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: appColor == 2 ? Colors.blue : appColor == 1 ? Colors.green : Colors.red,
        primarySwatch: appColor == 2 ? Colors.blue : appColor == 1 ? Colors.green : Colors.red,
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      home: HomePage(updateMyApp: update),
    );
  }
}