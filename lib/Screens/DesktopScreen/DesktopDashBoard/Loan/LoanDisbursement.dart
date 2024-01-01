import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import '../../../../Widget/LoanWidgets/LoanDetailsWidget.dart';
import '../../../../Widget/LoanWidgets/LoanInformation.dart';
import '../../../../Widget/LoanWidgets/LoanOtherInfo.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/TransactionWidget/Image.dart';
import '../../../../Widget/TransactionWidget/LinkACinfo.dart';


class LoanDisbursement extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanDisbursement({required this.appbool, required this.navbool});

  @override
  State<LoanDisbursement> createState() => _LoanDisbursementState();
}

class _LoanDisbursementState extends State<LoanDisbursement> {


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
            LoanDetailsWidget(title: 'Loan Disbursement Details',),

            SizedBox(
              height: 20,
            ),

            // Loan information
            LoanInformation(),

            SizedBox(
              height: 30,
            ),

            // Loan Other imformation
            LoanOtherInfo(),


            SizedBox(
              height: 30,
            ),


            // Link A/c Information
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Row(
                children: [
                  LinkACinfo(),

                  Spacer(),

                  ImageMember(),
                ],
              ),
            ),

            SizedBox(
              height: 50,
            ),

          ],
        ),
      ),

    );
  }
}
