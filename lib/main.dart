import 'dart:ui';

import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prottashasomit/ScreensCBS/Transaction/CashWithdraw.dart';
import 'package:prottashasomit/ScreensMFS/Reports/DailyGLSummary.dart';
import 'package:prottashasomit/ScreensMFS/Reports/DailyTransactionList.dart';
import 'package:prottashasomit/ScreensMFS/Reports/MemberLedger.dart';
import 'package:prottashasomit/ScreensMFS/Reports/MemberWiseDisburse.dart';
import 'package:prottashasomit/ScreensMFS/Reports/SamiteeWiseDisburse.dart';
import 'package:prottashasomit/ScreensMFS/Reports/SamiteeWiseMemberDepositLoan.dart';
import 'package:prottashasomit/ScreensMFS/Reports/SanctionDetailInformation.dart';
import 'package:prottashasomit/ScreensMFS/Reports/SlipReprint.dart';
import 'package:prottashasomit/route.dart';
import 'Constants/responsive.dart';
import 'Model/auth_middleware.dart';
import 'Screens/DashBoard/DashBoard.dart';
import 'Screens/Homepage/Homepage.dart';
import 'Screens/authentication/authentication.dart';
import 'Screens/roles/add_role.dart';
import 'Screens/roles/roles_list.dart';
import 'ScreensCBS/Account/RegularACOpen.dart';
import 'ScreensCBS/Account/RegularDepositAccount.dart';
import 'ScreensCBS/Customer/ExistingSamiteeMember.dart';
import 'ScreensCBS/Customer/IndividualCustomerRegistration.dart';
import 'ScreensCBS/Customer/NewCustomerRegistration.dart';
import 'ScreensCBS/Transaction/BOTransaction.dart';
import 'ScreensCBS/Transaction/CashDeposit.dart';
import 'ScreensCBS/Transaction/ReverseRequest.dart';
import 'ScreensCBS/Widgets/NavBoolCBS.dart';
import 'ScreensMFS/Loan/ApproveLoanSanctionRejectList.dart';
import 'ScreensMFS/Loan/LoanDisbursement.dart';
import 'ScreensMFS/Loan/LoanDisbursementList.dart';
import 'ScreensMFS/Loan/LoanRepaymentRequestList.dart';
import 'ScreensMFS/Loan/LoanRepaymentReverseRequestList.dart';
import 'ScreensMFS/Loan/LoanSaction.dart';
import 'ScreensMFS/Loan/LoanSactionApprove.dart';
import 'ScreensMFS/Loan/LoanSactionEdit.dart';
import 'ScreensMFS/Loan/LoanSanctionList.dart';
import 'ScreensMFS/Loan/RepaymentRequest.dart';
import 'ScreensMFS/Loan/ReverseRepayment.dart';
import 'ScreensMFS/MemberManagement/CloseMember.dart';
import 'ScreensMFS/MemberManagement/ClosedMembersList.dart';
import 'ScreensMFS/MemberManagement/DeadMemberInfo.dart';
import 'ScreensMFS/MemberManagement/EditMembers.dart';
import 'ScreensMFS/MemberManagement/MemberManagement.dart';
import 'ScreensMFS/MemberManagement/MemberRegistration.dart';
import 'ScreensMFS/MemberManagement/MemberUpdate.dart';
import 'ScreensMFS/MemberManagement/SamiteeList.dart';
import 'ScreensMFS/MemberManagement/SamiteeRegistration.dart';
import 'ScreensMFS/Reports/GeneralLedgerStatement.dart';
import 'ScreensMFS/Transaction/DepositCollectionRequest.dart';
import 'ScreensMFS/Transaction/DepositCollectionRequestList.dart';
import 'ScreensMFS/Transaction/DepositCorrectionRequest.dart';
import 'ScreensMFS/Transaction/DepositCorrectionRequestList.dart';
import 'ScreensMFS/Transaction/DepositWithDwarNormal.dart';
import 'ScreensMFS/Transaction/WithdrawRequestList.dart';
import 'ScreensMFS/Widget/Appbool.dart';
import 'ScreensMFS/Widget/NavBoolMFS.dart';
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
      Navbool(false, false, false, false, false, false, false, false, false);
  NavboolCBS navboolcbs = NavboolCBS(false, false, false, false, false);

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
            page: () => AuthenticationPage(),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: dashboardPageRoute,
            page: () => DashBoard(
                  appbool: appbool,
                  navbool: navbool,
                  navboolcbs: navboolcbs,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: deadmemberPageRoute,
            page: () => DeadMemberInfo(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: repaymentreversePageRoute,
            page: () => ReverseRepayment(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: repaymentreverseListPageRoute,
            page: () => LoanRepaymentReverseRequestList(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: depositcollectionrequestPageRoute,
            page: () => DepositCollectionRequest(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: depositcorrectionrequestPageRoute,
            page: () => DepositCorrectionRequest(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
          middlewares: [AuthMiddleware()],
          name: userlistPageRoute,
          page: () => UserList(),
        ),
        GetPage(
          middlewares: [AuthMiddleware()],
          name: userlistPageRoute,
          page: () => AddUser(),
        ),
        GetPage(
            name: depositcollectionrequestlistPageRoute,
            page: () => DepositCollectionRequestList(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: depositcorrectionrequestlistPageRoute,
            page: () => DepositCorrectionRequestList(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: withdrawlistPageRoute,
            page: () => WidthdrawList(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: depositwithdrawPageRoute,
            page: () => DepositWithDwarNormal(
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
            name: loandisbursementlistPageRoute,
            page: () => LoanDisbursementList(
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

        GetPage(
            name: repaymentrequestlistPageRoute,
            page: () => LoanRepaymentRequestList(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        // Report's section
        GetPage(
            name: memberledgerPageRoute,
            page: () => MemberLedger(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: dailytransactionPageRoute,
            page: () => DailyTransactionList(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: dailyglsummaryPageRoute,
            page: () => DailyGLSummary(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: samiteewisememberdepositPageRoute,
            page: () => SamiteeWiseMemberDepositeLoan(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: sanctiondetailsinformationPageRoute,
            page: () => SanctionDetailInformation(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: glstatementPageRoute,
            page: () => GenerallLedgerStatement(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: samiteewisedisbursePageRoute,
            page: () => SamiteeWiseDisburse(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: memberwishdisbursePageRoute,
            page: () => MemberWiseDisburse(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: slipreprintPageRoute,
            page: () => SlipReprint(
                  appbool: appbool,
                  navbool: navbool,
                ),
            middlewares: [AuthMiddleware()]),

        GetPage(
            name: individualmemberregistrationPageRoute,
            page: () => IndividualCustomerRegistration(
                  appbool: appbool,
                  navbool: navboolcbs,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: existingmemberregistrationPageRoute,
            page: () => ExistingSamiteeMember(
                  appbool: appbool,
                  navbool: navboolcbs,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: newcustomerregistrationPageRoute,
            page: () => NewCustomerRegistration(
                  appbool: appbool,
                  navbool: navboolcbs,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: regularaccountopenPageRoute,
            page: () => RegularACOpen(
                  appbool: appbool,
                  navbool: navboolcbs,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: cashdeposittransactionPageRoute,
            page: () => CashDeposit(
                  appbool: appbool,
                  navbool: navboolcbs,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: cashwithdrawtransactionPageRoute,
            page: () => CashWithdraw(
                  appbool: appbool,
                  navbool: navboolcbs,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: reverserequesttransactionPageRoute,
            page: () => ReverseRequest(
                  appbool: appbool,
                  navbool: navboolcbs,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: botransfertransactionPageRoute,
            page: () => BOTransaction(
                  appbool: appbool,
                  navbool: navboolcbs,
                ),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: regulardepositaccountopenPageRoute,
            page: () => RegularDepositAccount(
                  appbool: appbool,
                  navbool: navboolcbs,
                ),
            middlewares: [AuthMiddleware()]),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
