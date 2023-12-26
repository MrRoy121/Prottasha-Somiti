import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/ReportsWidgets/Ledger.dart';
import '../../../../Widget/ReportsWidgets/MemberWiseDisburseWidget.dart';
import '../../../../Widget/ReportsWidgets/TransactionList.dart';
import '../../../../Widget/SamiteeSelection.dart';


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
