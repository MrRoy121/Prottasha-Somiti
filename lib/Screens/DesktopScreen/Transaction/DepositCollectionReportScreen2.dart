import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/SamiteeSelection.dart';
import '../../../../Widget/TransactionWidget/MemberDeposit.dart';


class DepositCollectionReportScreen2 extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositCollectionReportScreen2({required this.appbool, required this.navbool});

  @override
  State<DepositCollectionReportScreen2> createState() => _DepositCollectionReportScreen2State();
}

class _DepositCollectionReportScreen2State extends State<DepositCollectionReportScreen2> {


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

          //  SamiteeSelection(submit: true, selectmember: false, clear: true, close: true,active: true,onsubmit: (){}),


            SizedBox(
              height: 50,
            ),

            // MEMBER DEPOSIT CORRECTION
            MemberDeposit(),




          ],
        ),
      ),

    );
  }
}
