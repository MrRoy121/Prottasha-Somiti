import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/SamiteeSelection.dart';


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
            NavbarScreen(appbool: widget.appbool, navbool: widget.navbool,),

            SizedBox(
              height: 50,
            ),

            SamiteeSelection(submit: true, selectmember: false, clear: true, close: true,),


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
