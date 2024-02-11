import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/LedgerStatement.dart';



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
            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),

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
