import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prottashasomit/Screens/DesktopScreen/Admin/admin_titas.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/Accounts/Accounts.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/Calculators/Calculators.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/DashBoard.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/Employee/Employee.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/Loan/Loan.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/MemberManagement/MemberManagement.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/Reports/Reports.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/Samitee%20Management/SamiteeManagement.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/Special%20Consideration/SpecialConsideration.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/Transaction/Transaction.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopHomepage/DesktopHomepage.dart';
import 'package:prottashasomit/Widget/NavBool.dart';

import '../../Widget/Appbool.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {

  Appbool appbool = Appbool(true, false, false);
  Navbool navbool = Navbool(true, false, false, false, false, false, false, false, false);

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
                child: DesktopHomePage(appbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'Dashboard':
            return PageTransition(
                child: DesktopDashBoard(appbool: appbool, navbool: navbool,),
                type: PageTransitionType.fade,
                settings: settings);
          case 'admin_titas':
            return PageTransition(
                child: Admin_titas(appbool),
                type: PageTransitionType.fade,
                settings: settings);

            // 2nd navbar
          case 'Member Management':
            return PageTransition(
                child: MemberManagement(navbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'Transaction':
            return PageTransition(
                child: Transaction(navbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'Loan':
            return PageTransition(
                child: Loan(navbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'Reports':
            return PageTransition(
                child: Reports(navbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'Accounts':
            return PageTransition(
                child: Accounts(navbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'Employee':
            return PageTransition(
                child: Employee(navbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'Samitee Management':
            return PageTransition(
                child: SamiteeManagement(navbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'Calculators':
            return PageTransition(
                child: Calculators(navbool),
                type: PageTransitionType.fade,
                settings: settings);
          case 'Special Consideration':
            return PageTransition(
                child: SpecialConsideration(navbool),
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
