import 'package:flutter/material.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import 'Widgets/SamiteeWiseDisburseWidget.dart';

class SamiteeWiseDisburse extends StatefulWidget {
  NavboolCBS navbool;
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
            NavbarScreenCBS(appbool: widget.appbool, navbool: widget.navbool,),

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
