import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:poc/pages/goals_page.dart';
import 'package:poc/utils/colors.dart';
import 'package:poc/Screens/SplashScreen.dart';
import 'package:poc/Screens/LoginScreen.dart';
import 'package:poc/Screens/SignUpScreen.dart';
import 'package:poc/Constant/Constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return DynamicTheme(

      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primaryColor: MyColors.primaryColor,
        accentColor: MyColors.accentColor,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            title: "Audio App",
            theme: theme,
           home:SplashScreen(),
          routes: <String, WidgetBuilder>{
              LOGIN_SCREEN: (BuildContext context) => new LogInScreen(),
            SIGN_UP_SCREEN: (BuildContext context) => new SignUpScreen(),
            ANIMATED_SPLASH: (BuildContext context) => new SplashScreen()
          },
        );
      },
    );
  }
}
