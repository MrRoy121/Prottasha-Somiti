import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/ReportsWidgets/Ledger.dart';
import '../../../../Widget/ReportsWidgets/SlipReprintWidget.dart';
import '../../../../Widget/ReportsWidgets/TransactionList.dart';
import '../../../../Widget/SamiteeSelection.dart';


class SlipReprint extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SlipReprint({required this.appbool, required this.navbool});

  @override
  State<SlipReprint> createState() => _SlipReprintState();
}

class _SlipReprintState extends State<SlipReprint> {


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


            // SLIP RE-PRINT
            SlipReprintWidget(),


          ],
        ),
      ),

    );
  }
}
