import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/GLSummary.dart';

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
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100,left: 50),
              child: Column(
                children: [
                  GLSummary(),
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
