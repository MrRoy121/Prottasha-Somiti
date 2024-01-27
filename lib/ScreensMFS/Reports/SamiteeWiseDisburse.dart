import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBool.dart';
import '../Widget/NavbarScreen.dart';
import '../Widget/ReportsWidgets/SamiteeWiseDisburseWidget.dart';

class SamiteeWiseDisburse extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SamiteeWiseDisburse({required this.appbool, required this.navbool});

  @override
  State<SamiteeWiseDisburse> createState() => _SamiteeWiseDisburseState();
}

class _SamiteeWiseDisburseState extends State<SamiteeWiseDisburse> {


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


            // Samitee Wise Disburse, Over Due & Outstanding
            SamiteeWiseDisburseWidget(),



          ],
        ),
      ),

    );
  }
}
