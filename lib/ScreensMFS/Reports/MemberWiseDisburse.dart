import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBool.dart';
import '../Widget/NavbarScreen.dart';
import '../Widget/ReportsWidgets/MemberWiseDisburseWidget.dart';


class MemberWiseDisburse extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  MemberWiseDisburse({required this.appbool, required this.navbool});

  @override
  State<MemberWiseDisburse> createState() => _MemberWiseDisburseState();
}

class _MemberWiseDisburseState extends State<MemberWiseDisburse> {


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


            // Member Wise Disburse, Over Due & Outstanding
            MemberWiseDisburseWidget(),


          ],
        ),
      ),

    );
  }
}
