import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBool.dart';
import '../Widget/NavbarScreen.dart';
import '../Widget/ReportsWidgets/GLSummary.dart';


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
