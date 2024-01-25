import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LedgerTransactionSelection.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanDetailsWidget.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/SamiteeSelection.dart';
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
           // SamiteeSelection(submit: false, selectmember: false, clear: false, close: false, active: true,onsubmit: (){},),

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
