import 'package:flutter/material.dart';
import 'package:prottashasomit/ResponsiveLayout/ResponsiveLayout.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopScaffold.dart';
import 'package:prottashasomit/Screens/MobileScreen/MobileScaffold.dart';
import 'package:prottashasomit/Screens/TabletScreen/TabletScaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ResponsiveScreenLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}

