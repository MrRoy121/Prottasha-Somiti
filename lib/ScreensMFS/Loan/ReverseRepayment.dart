import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LedgerTransactionSelection.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanDetailsWidget.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

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
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  // Loan Disbursement Details
                  LoanDetailsWidget(
                    title: 'Reverse Repayment',
                    onsubmit: (){},
                    onclear: (){},onfine: (){},showfine: false,
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
