import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/SamiteeSelection.dart';
import '../../../../Widget/LoanWidgets/LastRepaymentInfo.dart';
import '../../../../Widget/LoanWidgets/LedgerTransactionSelection.dart';
import '../../../../Widget/LoanWidgets/LoanDetailsWidget.dart';
import '../../../../Widget/LoanWidgets/LoanRepaymentWidget.dart';
import '../../../../Widget/LoanWidgets/RepaymentLoanInfo.dart';
import '../../../../Widget/NavbarScreen.dart';


class ReverseRepayment extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  ReverseRepayment({required this.appbool, required this.navbool});

  @override
  State<ReverseRepayment> createState() => _ReverseRepaymentState();
}

class _ReverseRepaymentState extends State<ReverseRepayment> {


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

            // Samitee Selection
            SamiteeSelection(submit: false, selectmember: false, clear: false, close: false, active: true),

            SizedBox(
              height: 30,
            ),

            // Ledger Trasaction Selection
            LedgerTrasactionSelection(),


            SizedBox(
              height: 50,
            ),

          ],
        ),
      ),

    );
  }
}
