import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/SamiteeSelection.dart';
import '../../../../Widget/LoanWidgets/LastRepaymentInfo.dart';
import '../../../../Widget/LoanWidgets/LedgerTransactionSelection.dart';
import '../../../../Widget/LoanWidgets/LoanDetailsWidget.dart';
import '../../../../Widget/LoanWidgets/LoanRepaymentWidget.dart';
import '../../../../Widget/LoanWidgets/ReScheduleLoanInfo.dart';
import '../../../../Widget/LoanWidgets/RepaymentLoanInfo.dart';
import '../../../../Widget/LoanWidgets/RequestInfo.dart';
import '../../../../Widget/NavbarScreen.dart';


class LoanReSchedule extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanReSchedule({required this.appbool, required this.navbool});

  @override
  State<LoanReSchedule> createState() => _LoanReScheduleState();
}

class _LoanReScheduleState extends State<LoanReSchedule> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreen(appbool: widget.appbool, navbool: widget.navbool,),

            SizedBox(
              height: 50,
            ),

            // Loan Disbursement Details
            LoanDetailsWidget(title: 'Reverse Repayment',),

            SizedBox(
              height: 20,
            ),

            // Request Information
            RequestInfo(),

            SizedBox(
              height: 30,
            ),

            // Loan information
            ReScheduleLoanInfo(),


            SizedBox(
              height: 50,
            ),

          ],
        ),
      ),

    );
  }
}
