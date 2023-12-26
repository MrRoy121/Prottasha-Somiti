import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/ReportsWidgets/Ledger.dart';
import '../../../../Widget/ReportsWidgets/LedgerStatement.dart';
import '../../../../Widget/SamiteeSelection.dart';


class GenerallLedgerStatement extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  GenerallLedgerStatement({required this.appbool, required this.navbool});

  @override
  State<GenerallLedgerStatement> createState() => _GenerallLedgerStatementState();
}

class _GenerallLedgerStatementState extends State<GenerallLedgerStatement> {


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


            // GENERAL LEDGER STATEMENT
            LedgerStatement(),




          ],
        ),
      ),

    );
  }
}
