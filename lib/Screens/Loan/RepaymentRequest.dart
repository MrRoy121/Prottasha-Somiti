import 'package:flutter/material.dart';
import 'package:prottashasomit/Screens/Loan/widgets/LastRepaymentInfo.dart';
import 'package:prottashasomit/Screens/Loan/widgets/LoanDetailsWidget.dart';
import 'package:prottashasomit/Screens/Loan/widgets/LoanRepaymentWidget.dart';
import 'package:prottashasomit/Screens/Loan/widgets/RepaymentLoanInfo.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/TransactionWidget/Image.dart';
import '../../../../Widget/TransactionWidget/LinkACinfo.dart';


class RepaymentRequest extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  RepaymentRequest({required this.appbool, required this.navbool});

  @override
  State<RepaymentRequest> createState() => _RepaymentRequestState();
}

class _RepaymentRequestState extends State<RepaymentRequest> {


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

            // Loan repayment
            LoanRepaymentWidget(),

            SizedBox(
              height: 30,
            ),

            // Loan imformation
            RepaymentLoanINfo(),


            SizedBox(
              height: 30,
            ),


            // Last Repayment Information
            LastRepaymentInfo(),

            SizedBox(
              height: 50,
            ),

          ],
        ),
      ),

    );
  }
}
