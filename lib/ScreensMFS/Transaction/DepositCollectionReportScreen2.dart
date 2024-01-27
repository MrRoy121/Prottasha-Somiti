import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/TransactionWidget/MemberDeposit.dart';


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
            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),

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
