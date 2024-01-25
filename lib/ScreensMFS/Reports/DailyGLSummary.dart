import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/ReportsWidgets/GLSummary.dart';
import '../../../../Widget/ReportsWidgets/Ledger.dart';
import '../../../../Widget/SamiteeSelection.dart';


class DailyGLSummary extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DailyGLSummary({required this.appbool, required this.navbool});

  @override
  State<DailyGLSummary> createState() => _DailyGLSummaryState();
}

class _DailyGLSummaryState extends State<DailyGLSummary> {


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

            // Daily GL Summary
            GLSummary(),


          ],
        ),
      ),

    );
  }
}
