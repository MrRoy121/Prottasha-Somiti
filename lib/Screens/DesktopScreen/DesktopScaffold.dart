import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prottashasomit/Screens/DesktopScreen/Admin/admin_titas.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/DashBoard.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopHomepage/DesktopHomeNavbar.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopHomepage/DesktopHomepage.dart';

import '../../Widget/Appbool.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {

  Appbool navbool = Appbool(true, false, false);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prothasha Somitee Ltd.',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      initialRoute: "Home",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'Home':
            return PageTransition(
                child: DesktopHomePage(navbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'Dashboard':
            return PageTransition(
                child: DesktopDashBoard(navbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'admin_titas':
            return PageTransition(
                child: Admin_titas(navbool),
                type: PageTransitionType.fade,
                settings: settings);

        // case 'FoodView':
        //   return PageTransition(
        //       child: FoodView(sideNavbool),
        //       type: PageTransitionType.fade,
        //       settings: settings);
        }
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

    );

    // return MaterialApp(
    //   home: DesktopHomeNavbar(),
    // );
  }
}
