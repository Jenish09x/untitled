import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screen/contact/provider/contact_provider.dart';
import 'package:untitled/screen/dash_screen/provider/dash_screen_provider.dart';
import 'package:untitled/utils/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashProvider(),
        ),
      ],
      child: Platform.isIOS
          ? MaterialApp(
              theme: ThemeData(useMaterial3: true),
              debugShowCheckedModeBanner: false,
              routes: screen_routes,
            )
          : CupertinoApp(
              debugShowCheckedModeBanner: false,
              routes: ios_screen_routes,
            ),
    ),
  );
}
