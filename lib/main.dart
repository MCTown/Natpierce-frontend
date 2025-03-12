import 'package:flutter/material.dart';

import 'Pages/Login/login_page.dart';
import 'Pages/Register/register_page.dart';
import 'Pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(), // iOS 风格
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      // initialRoute: '/',  // 设置默认页面
      routes: {
        // '/': (context) => Welcome(),
        '/register': (context) => Register(),
        '/login': (context) => Login(),
      },
      home: const Welcome(),
    );
  }
}

