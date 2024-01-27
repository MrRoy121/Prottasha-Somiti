import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/NoDataFound.dart';


class DepositCollectionReport extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositCollectionReport({required this.appbool, required this.navbool});

  @override
  State<DepositCollectionReport> createState() => _DepositCollectionReportState();
}

class _DepositCollectionReportState extends State<DepositCollectionReport> {


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

        //    SamiteeSelection(submit: true, selectmember: false, clear: true, close: true,active: true,onsubmit: (){}),


            SizedBox(
              height: 50,
            ),

            NoDataFound(title: "Member List for Deposit Posting"),


          ],
        ),
      ),

    );
  }
}
