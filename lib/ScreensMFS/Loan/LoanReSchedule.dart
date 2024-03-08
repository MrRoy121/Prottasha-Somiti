import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanDetailsWidget.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/ReScheduleLoanInfo.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/RequestInfo.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

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
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  // Loan Disbursement Details
                  LoanDetailsWidget(
                    title: 'Reverse Repayment',
                    onsubmit: () {},
                    onfine: () {},
                    showfine: false,
                    onclear: () {},
                  ),

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
            NavbarScreenMFS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
