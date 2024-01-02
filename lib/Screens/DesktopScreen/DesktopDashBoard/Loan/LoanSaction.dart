import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/LoanWidgets/LoanGuarantor.dart';
import '../../../../Widget/LoanWidgets/LoanGuarantor_family.dart';
import '../../../../Widget/LoanWidgets/LoanSamitteSelection.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/SamiteeSelection.dart';
import '../../../../Widget/TransactionWidget/MemberDeposit.dart';


class LoanSanction extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanSanction({required this.appbool, required this.navbool});

  @override
  State<LoanSanction> createState() => _LoanSanctionState();
}

class _LoanSanctionState extends State<LoanSanction> {


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

            // Saction limit request
            LoanSamitteSelection(),


            SizedBox(
              height: 50,
            ),

            // Loan Guarantor information
            LoanGuarantor(),

            SizedBox(
              height: 50,
            ),
            // LoanGuarantorFamily(),

            LoanGuarantor_family(),

            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),

    );
  }
}
