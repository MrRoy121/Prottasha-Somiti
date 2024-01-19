import 'dart:ui';

import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prottashasomit/route.dart';
import 'Constants/responsive.dart';
import 'Model/auth_middleware.dart';
import 'Screens/Accounts/Accounts.dart';
import 'Screens/Calculators/Calculators.dart';
import 'Screens/DesktopDashBoard/DashBoard.dart';
import 'Screens/Employee/Employee.dart';
import 'Screens/Loan/ApproveLoanSanctionRejectList.dart';
import 'Screens/Loan/Loan.dart';
import 'Screens/Loan/LoanDisbursement.dart';
import 'Screens/Loan/LoanSaction.dart';
import 'Screens/Loan/LoanSactionApprove.dart';
import 'Screens/Loan/LoanSactionEdit.dart';
import 'Screens/Loan/LoanSanctionList.dart';
import 'Screens/Loan/RepaymentRequest.dart';
import 'Screens/MemberManagement/CloseMember.dart';
import 'Screens/MemberManagement/ClosedMembersList.dart';
import 'Screens/MemberManagement/EditMembers.dart';
import 'Screens/MemberManagement/MemberManagement.dart';
import 'Screens/MemberManagement/MemberRegistration.dart';
import 'Screens/MemberManagement/MemberUpdate.dart';
import 'Screens/MemberManagement/SamiteeList.dart';
import 'Screens/MemberManagement/SamiteeRegistration.dart';
import 'Screens/Reports/Reports.dart';
import 'Screens/Samitee Management/SamiteeManagement.dart';
import 'Screens/Special Consideration/SpecialConsideration.dart';
import 'Screens/Transaction/Transaction.dart';
import 'Screens/DesktopHomepage/DesktopHomepage.dart';
import 'Screens/authentication/authentication.dart';
import 'Widget/Appbool.dart';
import 'Widget/NavBool.dart';
import 'Constants/responsive.dart';
import 'helpers/auth_service.dart';

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
  await Get.put(AuthService());
  final authService = AuthService.to;
  await authService.loadAuthenticationStatus();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Appbool appbool = Appbool(true, false, false);
  Navbool navbool =
      Navbool(true, false, false, false, false, false, false, false, false);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prothasha Somitee Ltd.',
      defaultTransition: Transition.fadeIn,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      initialRoute: authenticationPageRoute,

      getPages: [
        GetPage(
          name: authenticationPageRoute,
          page: () => AuthenticationPage(),
        ),
        GetPage(
            name: homePageRoute,
            page: () => DesktopHomePage(
                  navbool: appbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: authenticationPageRoute,
            page: () => AuthenticationPage(
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: dashboardPageRoute,
            page: () => DesktopDashBoard(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: sanctionloaneditPageRoute,
            page: () => LoanSanctionEdit(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: somiteeregistrationPageRoute,
            page: () => SamiteeRegistration(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: memberegistrationPageRoute,
            page: () => MemberRegistration(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: memberclosingPageRoute,
            page: () => CloseMember(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: closingmemberrequestPageRoute,
            page: () => ClosedMembersList(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: somiteelistPageRoute,
            page: () => ShamiteeList(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: memberlistPageRoute,
            page: () => EditMembers(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: memberEditPageRoute,
            page: () => MemberUpdate(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: sanctionloanrequestPageRoute,
            page: () => LoanSanction(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: sanctionloanapprovePageRoute,
            page: () => LoanSanctionApprove(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: sanctionloanapprovelistPageRoute,
            page: () => ApproveLoanSanctionReject(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: loandisbursementPageRoute,
            page: () => LoanDisbursement(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: loanrequestlistPageRoute,
            page: () => LoanSanctionList(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: repaymentrequestPageRoute,
            page: () => RepaymentRequest(
              appbool: appbool,
              navbool: navbool,
            ),
            middlewares: [AuthMiddleware()]),
      ],
      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     // 2nd navbar
      //     case 'Member Management':
      //       return PageTransition(
      //           child: MemberManagement(navbool),
      //           type: PageTransitionType.fade,
      //           settings: settings);
      //     case 'Transaction':
      //       return PageTransition(
      //           child: Transaction(navbool),
      //           type: PageTransitionType.fade,
      //           settings: settings);
      //     case 'Loan':
      //       return PageTransition(
      //           child: Loan(navbool),
      //           type: PageTransitionType.fade,
      //           settings: settings);
      //     case 'Reports':
      //       return PageTransition(
      //           child: Reports(navbool),
      //           type: PageTransitionType.fade,
      //           settings: settings);
      //     case 'Accounts':
      //       return PageTransition(
      //           child: Accounts(navbool),
      //           type: PageTransitionType.fade,
      //           settings: settings);
      //     case 'Employee':
      //       return PageTransition(
      //           child: Employee(navbool),
      //           type: PageTransitionType.fade,
      //           settings: settings);
      //     case 'Samitee Management':
      //       return PageTransition(
      //           child: SamiteeManagement(navbool),
      //           type: PageTransitionType.fade,
      //           settings: settings);
      //     case 'Calculators':
      //       return PageTransition(
      //           child: Calculators(navbool),
      //           type: PageTransitionType.fade,
      //           settings: settings);
      //     case 'Special Consideration':
      //       return PageTransition(
      //           child: SpecialConsideration(navbool),
      //           type: PageTransitionType.fade,
      //           settings: settings);
      //
      //     // case 'FoodView':
      //     //   return PageTransition(
      //     //       child: FoodView(sideNavbool),
      //     //       type: PageTransitionType.fade,
      //     //       settings: settings);
      //   }
      // },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
