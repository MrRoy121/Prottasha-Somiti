import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/SamiteeWiseDisburseWidget.dart';

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
            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),

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
