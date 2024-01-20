import 'package:flutter/material.dart';
import 'package:prottashasomit/Screens/Loan/widgets/LoanDetailsWidget.dart';
import 'package:prottashasomit/Screens/Loan/widgets/ReScheduleLoanInfo.dart';
import 'package:prottashasomit/Screens/Loan/widgets/RequestInfo.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
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
