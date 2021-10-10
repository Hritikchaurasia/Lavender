import 'package:flutter/material.dart';

import 'presentation/pages/splash_screen.dart';
import 'utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
           fontFamily: 'Mukta',
          scaffoldBackgroundColor: backgroundColor,
          buttonColor: darkBlueColor,
          accentColor: whiteColor,
          iconTheme: IconThemeData(color: whiteColor),
          appBarTheme: AppBarTheme(backgroundColor: darkGreyColor),
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: darkGreyColor),
          hintColor: whiteColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent)
            )
          )
          ),
      title: 'lavender',
      home: SplashScreen(),
    );
  }
}
