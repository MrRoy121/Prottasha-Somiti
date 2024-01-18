import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prottashasomit/route.dart';
import 'Constants/responsive.dart';
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
  Navbool navbool =
      Navbool(true, false, false, false, false, false, false, false, false);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prothasha Somitee Ltd.',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      initialRoute: authenticationPageRoute,
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
          case authenticationPageRoute:
            return PageTransition(
                child: AuthenticationPage(),
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
          case sanctionloaneditPageRoute:
            return PageTransition(
                child: LoanSanctionEdit(
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
          case memberclosingPageRoute:
            return PageTransition(
                child: CloseMember(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case closingmemberrequestPageRoute:
            return PageTransition(
                child: ClosedMembersList(
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
          case memberlistPageRoute:
            return PageTransition(
                child: EditMembers(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case memberEditPageRoute:
            return PageTransition(
                child: MemberUpdate(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case sanctionloanrequestPageRoute:
            return PageTransition(
                child: LoanSanction(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case sanctionloanapprovePageRoute:
            return PageTransition(
                child: LoanSanctionApprove(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case sanctionloanapprovelistPageRoute:
            return PageTransition(
                child: ApproveLoanSanctionReject(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case loandisbursementPageRoute:
            return PageTransition(
                child: LoanDisbursement(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case loanrequestlistPageRoute:
            return PageTransition(
                child: LoanSanctionList(
                  appbool: appbool,
                  navbool: navbool,
                ),
                type: PageTransitionType.fade,
                settings: settings);
          case repaymentrequestPageRoute:
            return PageTransition(
                child: RepaymentRequest(
                  appbool: appbool,
                  navbool: navbool,
                ),
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
