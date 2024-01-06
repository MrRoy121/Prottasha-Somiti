import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/Screens/MobileScreen/MobileScaffold.dart';
import 'package:prottashasomit/Screens/TabletScreen/TabletScaffold.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prottashasomit/route.dart';
import 'package:prottashasomit/Screens/MobileScreen/MobileScaffold.dart';
import 'package:prottashasomit/Screens/TabletScreen/TabletScaffold.dart';
import 'Constants/responsive.dart';
import 'Screens/DesktopScreen/Admin/admin_titas.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/Accounts/Accounts.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/Calculators/Calculators.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/DashBoard.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/Employee/Employee.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/Loan/Loan.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/MemberManagement/MemberManagement.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/MemberManagement/MemberRegistration.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/MemberManagement/SamiteeList.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/MemberManagement/SamiteeRegistration.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/Reports/Reports.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/Samitee Management/SamiteeManagement.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/Special Consideration/SpecialConsideration.dart';
import 'Screens/DesktopScreen/DesktopDashBoard/Transaction/Transaction.dart';
import 'Screens/DesktopScreen/DesktopHomepage/DesktopHomepage.dart';
import 'Widget/Appbool.dart';
import 'Widget/NavBool.dart';
import 'Constants/responsive.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCU3KjFwWGNfbqDPyHFbzb4RzHKhQ-CNio",
        authDomain: "prottshasomitee.firebaseapp.com",
        projectId: "prottshasomitee",
        storageBucket: "prottshasomitee.appspot.com",
        messagingSenderId: "85054437453",
        appId: "1:85054437453:web:0d286f140c6f63504e0404",
        measurementId: "G-XQPZLS697J"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      initialRoute: homePageRoute,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case homePageRoute:
            return PageTransition(
                // child: DesktopHomePage(navbool:appbool,rs: widget.rs),
                child: DesktopHomePage(
                  navbool: appbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case dashboardPageRoute:
            return PageTransition(
                child: DesktopDashBoard(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case somiteeregistrationPageRoute:
            return PageTransition(
                child: SamiteeRegistration(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);

          case memberegistrationPageRoute:
            return PageTransition(
                child: MemberRegistration(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case somiteelistPageRoute:
            return PageTransition(
                child: ShamiteeList(
                  appbool: appbool,
                  navbool: navbool,
                ),
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
  }
}
